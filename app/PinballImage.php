<?php
namespace App;

/**
 * The PinballImage class manages the pinball images. It uses hard-coded SQL queries
 * instead of relying on the built-in Eloquent and entity relationship engines of Laravel.
 *
 * @author Ike Quigley
 * Last Updated: 04/23/2020
 */

use Illuminate\Database\Eloquent\Model;
use \DB as DB;

class PinballImage extends Model
{

    /**
     * Uploads and saves an image record from the request array.
     * @param Request $request
     * @return \App\PinballImage
     */
    public static function createFromUpload($request)
    {
        $file = $request->file('file');
        $path = $file->store("public/img");
        $path = str_replace("public", "storage", $path);
        $image = new PinballImage();
        $image->uuid = uniqid();
        $image->pinball_uuid = $request->input("pinball_uuid");
        $image->file_name = $path;
        $image->save();
        return $image;
    }

    /**
     * Given a uuid for a pinball machine, this method returns the fully qualified
     * url for that image.
     * @param String $pinball_uuid
     * @return String - the full image url.
     */
    public static function getCoverPhotoForPinball($pinball_uuid)
    {
$query=<<<QUERY
        SELECT pinball_images.file_name
        FROM pinball_images WHERE pinball_uuid = '{$pinball_uuid}'
        ORDER BY pinball_images.id LIMIT 1;
QUERY;
        $result = DB::select(DB::raw($query));
        if (!empty($result)) {
            return asset($result[0]->file_name);
        }
        return "";
    }

    /**
     * Loads all the images for a given PinballMachine object.
     * @param PinballMachine $pinball
     * @return [PinballImage]
     */
    public static function loadImagesForPinballMachine($pinball) {
        return static::loadImagesForPinballMachineUuid($pinball->uuid);
    }

    /**
     * Loads all the images for a given PinballMachine uuid.
     * @param String $pinball_uuid
     * @return [PinballImage
     */
    public static function loadImagesForPinballMachineUuid($pinball_uuid) {
$query=<<<QUERY
        SELECT * FROM pinball_images WHERE pinball_uuid = '{$pinball_uuid}';
QUERY;
        return DB::select(DB::raw($query));
    }


}
