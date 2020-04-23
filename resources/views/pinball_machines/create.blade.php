@extends('inc.common')


@section('title')Create a New Pinball Machine!
@endsection

@section('content')
<style>
    .form-group{
        margin-top: 15px;
    }

    .checkbox-container{
        border: .05px solid darkgray;
        border-radius: 6px;
        padding: 10px;
        height: auto;
        overflow-y: scroll;
        float:none;
    }

</style>

<div class="container">
    <div class="row">
        <div class="col-sm-10 col-md-offset-1">
            <h2>Add a New Pinball Machine</h2>
            <a href='/pinball'><button class='btn btn-primary'>Exit <i class='far fa-hand-peace'></i></button></a>
            <form method='post' action='store'>
                @csrf
                <hr/>
                <div class='row'>
                    <div class='col-sm-6'>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label for='name' class='pull-left'>Name</label>
                                <input id='name' name='name' class='form-control input-md' type='text' placeholder='Name' required/>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-6'>
                        <div id='image-drop-zone-container'></div>
                    </div>
                </div>
                <hr/>

                <div class='row'>
                    <div class='col-sm-6 col-xs-12'>

                        <div class='form-group input-block'>
                            <label for='model_number' class='pull-left'>Model Number</label>
                            <input id='model_number' name='model_number' class='form-control input-md' type='text' placeholder='Model Number'/>
                        </div>

                        <div class='form-group input-block'>
                            <label for='manufacturer_uuid' class='pull-left'>Manufacturer</label>
                            <select name='manufacturer_uuid' class='form-control input-md'>
                                @foreach($manufacturers as $manufacturer)
                                <option value='{{$manufacturer->uuid}}'>{{$manufacturer->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='date_of_manufacture' class='pull-left'>Date of Manufacture</label>
                            <input id='date_of_manufacture' data-provide="datepicker" name='date_of_manufacture' class='form-control input-md' type='date' />
                        </div>

                        <div class='form-group input-block'>
                            <label for='ipd_number' class='pull-left'>IPD Number</label>
                            <input id='ipd_number'  name='ipd_number' class='form-control input-md' type='number' step='1' />
                        </div>

                        <div class='form-group input-block'>
                            <label for='number_of_players' class='pull-left'>Number of Players</label>
                            <input id='number_of_players'  name='number_of_players' class='form-control input-md' type='number' step='1' />
                        </div>

                        <div class='form-group input-block'>
                            <label for='average_fun_rating' class='pull-left'>Average Fun Rating</label>
                            <input id='average_fun_rating'  name='average_fun_rating' class='form-control input-md' type='number' step='0.1' />
                        </div>

                        <div class='form-group input-block'>
                            <label for='mpu' class='pull-left'>MPU</label>
                            <select name='mpu_uuid' class='form-control input-md'>
                                @foreach($mpus as $mpu)
                                <option value='{{$mpu->uuid}}'>{{$mpu->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='type' class='pull-left'>Type</label>
                            <select name='type_uuid' class='form-control input-md'>
                                @foreach($types as $type)
                                <option value='{{$type->uuid}}'>{{$type->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='production' class='pull-left'>Production</label>
                            <input id='production'  name='production' class='form-control input-md' type='number' step='1' />
                        </div>

                        <div class='form-group input-block'>
                            <label for='type' class=''>Themes</label>
                            <div class='checkbox-container'>
                                @foreach($themes as $theme)
                                <div class="form-check" style='float:none !important;text-align:left;'>
                                    <input class="form-check-input" id='theme-{{$theme->id}}' name='theme[{{$theme->id}}]' type="checkbox" value="{{$theme->uuid}}" >
                                    <label class="form-check-label" for="theme-{{$theme->id}}">{{$theme->name}}</label>
                                </div>
                                @endforeach
                            </div>
                        </div>


                    </div>

                    <div class='col-sm-6 col-xs-12'>


                        <div class='form-group input-block'>
                            <label for='common_abbreviations' class='pull-left'>Common Abbreviations</label>
                            <input id='common_abbreviations' name='common_abbreviations' class='form-control input-md' type='text'/>
                        </div>

                        <div class='form-group input-block'>
                            <label for='video_link' class='pull-left'>Promotional Video</label>
                            <input id='video_link' name='video_link' class='form-control input-md' type='url' placeholder='https://youtube.com/id'/>
                        </div>

                        <div class='form-group input-block'>
                            <label for='concept_art_uuid' class='pull-left'>Concept By</label>
                            <select name='concept_art_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='design_by' class='pull-left'>Design By</label>
                            <select name='design_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='art_by' class='pull-left'>Art By</label>
                            <select name='art_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='dots_animation_by' class='pull-left'>Dots Animation By</label>
                            <select name='dots_animation_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='mechanics_by' class='pull-left'>Mechanics By</label>
                            <select name='mechanics_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='music_by' class='pull-left'>Music By</label>
                            <select name='music_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='sound_by' class='pull-left'>Sound By</label>
                            <select name='sound_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class='form-group input-block'>
                            <label for='software_by' class='pull-left'>Software By</label>
                            <select name='software_by_uuid' class='form-control input-md'>
                                <option value=''>Not Specified</option>
                                @foreach($artists as $artist)
                                <option value='{{$artist->uuid}}'>{{$artist->name}}</option>
                                @endforeach
                            </select>
                        </div>

                    </div>

                </div>
                <hr/>
                <div class='row'>
                    <div class='col-sm-12'>
                        <div class='form-group input-block'>
                            <label for='marketing_slogan' class='pull-left'>Marketing Slogan</label>
                            <textarea id='marketing_slogan' name='marketing_slogan' class='form-control input-md' /></textarea>
                        </div>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-sm-12'>
                        <div class='form-group input-block'>
                            <label for=toys' class='pull-left'>Toys</label>
                            <textarea id='toys' name='toys' class='form-control input-md' /></textarea>
                        </div>
                    </div>
                </div>

                 <div class='row'>
                    <div class='col-sm-12'>
                        <div class='form-group input-block'>
                            <label for='notable_features' class='pull-left'>Notable Features</label>
                            <textarea id='notable_features' name='notable_features' class='form-control input-md' /></textarea>
                        </div>
                    </div>
                </div>


                <div class='row'>
                    <div class='col-sm-12'>
                        <div class='form-group input-block'>
                            <label for='notes' class='pull-left'>Notes</label>
                            <textarea id='notes' name='notes' class='form-control input-md' /></textarea>
                        </div>
                    </div>
                </div>

                <button class='btn btn-secondary'>Submit</button>




            </form>

        </div>
    </div>
</div>
@endsection