<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use \DB;

class PinballMachine extends Model
{

    public static function loadAllRelatedObjects()
    {
$query=<<<QUERY
    SELECT pinball_machines.id as id,
           pinball_machines.name as name,
           pinball_machines.model_number,
           pinball_machines.date_of_manufacture as date_of_manufacture,
           manufacturers.name as manufacturer
    FROM   pinball_machines
    JOIN   manufacturers
    WHERE  pinball_machines.manufacturer_uuid = manufacturers.uuid
QUERY;
        return DB::select($query);
    }


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
      JOIN manufacturers
      JOIN country
      JOIN us_states
      JOIN pinball_types
      JOIN artists AS a_concept
      JOIN artists AS a_design
      JOIN artists AS a_art_by
      JOIN artists AS a_dot_animations
      JOIN artists AS a_mechanics
      JOIN artists AS a_music
      JOIN artists AS a_sound
      JOIN artists AS a_software
      JOIN mpus
WHERE
    pinball_machines.manufacturer_uuid = manufacturers.uuid
AND manufacturers.country_uuid = country.uuid
AND manufacturers.state_uuid = us_states.uuid
AND pinball_machines.type_uuid = pinball_types.uuid
AND pinball_machines.concept_art_uuid = a_concept.uuid
AND pinball_machines.design_by_uuid = a_design.uuid
AND pinball_machines.art_by_uuid = a_art_by.uuid
AND pinball_machines.dots_animation_by_uuid = a_dot_animations.uuid
AND pinball_machines.mechanics_by_uuid = a_mechanics.uuid
AND pinball_machines.music_by_uuid = a_music.uuid
AND pinball_machines.sound_by_uuid = a_sound.uuid
AND pinball_machines.software_by_uuid = a_software.uuid
AND pinball_machines.mpu_uuid = mpus.uuid
AND pinball_machines.id = {$id}
QUERY;
        return DB::select($query);
    }


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
        return DB::select($query);
    }

}
