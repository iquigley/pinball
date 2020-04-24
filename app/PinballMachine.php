<?php
namespace App;

/**
 * The PinballMachine class manages pinball machines. It uses hard-coded SQL queries
 * instead of relying on the built-in Eloquent and entity relationship engines of Laravel.
 *
 * @author Ike Quigley
 * Last Updated: 04/23/2020
 */

use Illuminate\Database\Eloquent\Model;
use App\PinballImage as PinballImage;
use \DB;

class PinballMachine extends Model
{

    /**
     * Returns the url of the first image uploaded to the system for this Pinball machine.
     * @return String
     */
    public function getCoverImageLink() {
        return PinballImage::getCoverPhotoForPinball($this->uuid);
    }

    /**
     * Loads all Pinball Object joined with the manufacturer Object.
     * @return [PinballMachines]
     */
    public static function loadAllRelatedObjects()
    {
$query=<<<QUERY
    SELECT pinball_machines.id as id,
           pinball_machines.uuid as uuid,
           pinball_machines.name as name,
           pinball_machines.model_number,
           pinball_machines.date_of_manufacture as date_of_manufacture,
           manufacturers.name as manufacturer
    FROM   pinball_machines
    LEFT JOIN   manufacturers ON pinball_machines.manufacturer_uuid = manufacturers.uuid;
QUERY;
        return static::hydrate(DB::select(DB::raw($query)));
    }


    /**
     * Loads the Pinball object and all associated entity objects.
     * @param int $id - The id of the pinball machine.
     * @return [PinballMachine]
     */
    public static function loadRelatedObjectById($id)
    {
$query=<<<QUERY
SELECT pinball_machines.*,
       manufacturers.name AS manufacturer,
       country.name AS country,
       us_states.name AS state,
       pinball_types.name AS type,
       a_concept.name AS concept_art,
       a_design.name AS designer,
       a_art_by.name AS art_by,
       a_dot_animations.name AS dot_animations_by,
       a_mechanics.name AS mechanics_by,
       a_music.name AS music_by,
       a_sound.name AS sound_by,
       a_software.name AS software_by,
       mpus.name AS mpu
FROM  pinball_machines
      LEFT JOIN manufacturers ON pinball_machines.manufacturer_uuid = manufacturers.uuid
      LEFT JOIN country ON manufacturers.country_uuid = country.uuid
      LEFT JOIN us_states ON manufacturers.state_uuid = us_states.uuid
      LEFT JOIN pinball_types ON pinball_machines.type_uuid = pinball_types.uuid
      LEFT JOIN artists AS a_concept ON pinball_machines.concept_art_uuid = a_concept.uuid
      LEFT JOIN artists AS a_design ON pinball_machines.design_by_uuid = a_design.uuid
      LEFT JOIN artists AS a_art_by ON  pinball_machines.art_by_uuid = a_art_by.uuid
      LEFT JOIN artists AS a_dot_animations ON pinball_machines.dots_animation_by_uuid = a_dot_animations.uuid
      LEFT JOIN artists AS a_mechanics ON pinball_machines.mechanics_by_uuid = a_mechanics.uuid
      LEFT JOIN artists AS a_music ON pinball_machines.music_by_uuid = a_music.uuid
      LEFT JOIN artists AS a_sound ON pinball_machines.sound_by_uuid = a_sound.uuid
      LEFT JOIN artists AS a_software ON pinball_machines.software_by_uuid = a_software.uuid
      LEFT JOIN mpus ON pinball_machines.mpu_uuid = mpus.uuid
WHERE pinball_machines.id = {$id}
QUERY;
        $pinballs = DB::select(DB::raw($query));
        return $pinballs[0];
    }


    /**
     * Loads all themes associated with the given PinballMachine id.
     * @param int $id
     * @return [Themes]
     */
    public static function loadPinballThemes($id) {
$query=<<<QUERY
SELECT themes.name
FROM  themes
      JOIN pinball_with_themes
      JOIN pinball_machines
WHERE
    themes.uuid = pinball_with_themes.theme_uuid
AND pinball_with_themes.pinball_uuid = pinball_machines.uuid
AND pinball_machines.id = {$id}
QUERY;
        return DB::select(DB::raw($query));
    }


    /**
     * Deletes the PinballMachine from the database.
     * @param ing $id
     * @return null
     */
    public static function deletePinballMachine($id) {
$query=<<<QUERY
DELETE FROM pinball_machines
WHERE pinball_machines.id = {$id}
QUERY;
        return DB::select(DB::raw($query));
    }


    /**
     * Creates a new PinballMachine record from the form.
     * @param [String] $request
     * @return int
     */
    public static function createPinballMachine($request) {
        $pinball = new PinballMachine;
        $pinball->uuid = uniqid();
        static::registerPinballProperties($pinball, $request);
        $pinball->save();
        static::updatePinballThemes($pinball->uuid, $request);
        return $pinball->id;
    }


    /**
     * Updates the PinballMachine record from the user form.
     * @param int $id
     * @param [String] $request
     * @return int
     */
    public static function updatePinballMachine($id, $request) {
        $pinball = PinballMachine::find($id);
        static::registerPinballProperties($pinball, $request);
        $pinball->save();
        static::updatePinballThemes($pinball->uuid, $request);
        return $pinball->id;
    }

    /**
     * Updates the themes associated with this PinballMachine
     * @param String $pinball_uuid
     * @param bool $request
     */
    public static function updatePinballThemes($pinball_uuid, $request) {
        // Clear out old themes.
$query1=<<<QUERY
            DELETE FROM `pinball_with_themes` WHERE pinball_uuid = '{$pinball_uuid}';
QUERY;
            DB::select(DB::raw($query1));
        // Attach the themes
        foreach ($request->input("theme") as $theme) {
$query2=<<<QUERY
            INSERT INTO `pinball_with_themes`(`pinball_uuid`, `theme_uuid`) VALUES ("{$pinball_uuid}","{$theme}");
QUERY;
            DB::select(DB::raw($query2));
        }
    }

    /**
     * Indicates whether or not the given PinballMachine uuid is attached to the given Theme uuid.
     * @param type $pinball
     * @param type $type
     * @return type
     */
    public static function hasTheme($pinball_uuid, $theme) {
        return count(DB::select("SELECT * FROM `pinball_with_themes` WHERE pinball_uuid = '{$pinball_uuid}' AND theme_uuid = '{$theme}'; "));
    }


    /**
     * Helper method for attaching form inputs to the PinballMachine properties.
     * @param PinballMachine $pinball
     * @param [String] $request - the submitted form.
     */
    protected static function registerPinballProperties(&$pinball, $request) {
        $pinball->name = $request->input('name');
        $pinball->model_number = $request->input('model_number');
        $pinball->manufacturer_uuid = $request->input('manufacturer_uuid');
        $pinball->date_of_manufacture = $request->input('date_of_manufacture');
        $pinball->ipd_number = $request->input('ipd_number');
        $pinball->number_of_players = $request->input("number_of_players");
        $pinball->average_fun_rating = $request->input('average_fun_rating');
        $pinball->mpu_uuid = $request->input('mpu_uuid');
        $pinball->type_uuid = $request->input('type_uuid');
        $pinball->production = $request->input('production');
        $pinball->common_abbreviations = $request->input('common_abbreviations');
        $pinball->video_link = $request->input('video_link');
        $pinball->concept_art_uuid = $request->input('concept_art_uuid');
        $pinball->design_by_uuid = $request->input('design_by_uuid');
        $pinball->art_by_uuid = $request->input('art_by_uuid');
        $pinball->dots_animation_by_uuid = $request->input('dots_animation_by_uuid');
        $pinball->mechanics_by_uuid = $request->input('mechanics_by_uuid');
        $pinball->music_by_uuid = $request->input('music_by_uuid');
        $pinball->sound_by_uuid = $request->input('sound_by_uuid');
        $pinball->software_by_uuid = $request->input('software_by_uuid');
        $pinball->marketing_slogan = $request->input("marketing_slogan");
        $pinball->toys = $request->input('toys');
        $pinball->notable_features = $request->input('notable_features');
        $pinball->notes = $request->input('notes');
    }


}
