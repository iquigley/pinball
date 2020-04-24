<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PinballImage as PinballImage;

class PinballImageController extends Controller
{
    /**
     * Store a newly created image in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public static function upload(Request $request) {
        $image = PinballImage::createFromUpload($request);
        echo (json_encode(array("url"=>$image->file_name)));
    }

    /**
     * Responds to AJAX request to load all of the images for a pinball machine.
     * @param Request $request
     */
    public static function load(Request $request) {
        $images = PinballImage::loadImagesForPinballMachineUuid($request->input('pinball_uuid'));
        echo (json_encode($images));
    }
}
