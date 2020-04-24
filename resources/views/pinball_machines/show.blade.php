@extends('inc.common')

@section('title')This is my Pinball Machine
@endsection

@section('content')
<style>
    .info-block{
        border-bottom: 0.4px solid darkgray;
        padding: 10px;
        margin-bottom: 10px;
    }

    .info-block-header{
    }

    .info-block-value{

    }
</style>

<h1>{{$pinballMachine->name}}({{$pinballMachine->common_abbreviations}})</h1>
<div class='container'>
    <div class='row'>
        <div class='col-sm-12'>
            <a href='/pinball/'><button class='btn btn-primary'>Exit <i class='far fa-hand-peace'></i></button></a>
            <a href='/pinball/edit/{{$pinballMachine->id}}'><button class='btn btn-primary'>Edit & Add Images <i class='far fa-edit'></i></button></a>
        </div>
    </div>
    <div class='row'>
        <div class='col-sm-6 col-xs-12'>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Model Number</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->model_number}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Manufacturer</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->manufacturer}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Date of Manufacture</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->date_of_manufacture}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>IPD Number</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->ipd_number}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Number of Players</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->number_of_players}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Average Fun Rating</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->average_fun_rating}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>MPU</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->mpu}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Type</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->type}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Production</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->production}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Themes</strong>
                </div>
                <div class='info-block-value'>
                    @foreach($themes as $theme)
                    {{$theme->name}}
                    @endforeach
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Date Added</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->created_at}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Last Updated</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->updated_at}}
                </div>
            </div>

        </div>
        <div class='col-sm-6 col-xs-12'>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Serial Numbers</strong>
                </div>
                <div class='info-block-value'>
                    <a href='http://www.ipsnd.net/View.aspx?id={{$pinballMachine->ipd_number}}'>http://www.ipsnd.net/View.aspx?id={{$pinballMachine->ipd_number}}</a>
                    {{$pinballMachine->production}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Owner List</strong>
                </div>
                <div class='info-block-value'>
                    <a href='http://www.pinballowners.com/owners/{{$pinballMachine->ipd_number}}' target='_blank'>http://www.pinballowners.com/owners/{{$pinballMachine->ipd_number}}</a>
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Easter Eggs</strong>
                </div>
                <div class='info-block-value'>
                    <a href='http://hem.bredband.net/b257182/Cows&Easter.htm#{{$pinballMachine->ipd_number}}' target='_blank'>http://hem.bredband.net/b257182/Cows&Easter.htm#{{$pinballMachine->ipd_number}}</a>
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Promotional Video</strong>
                </div>
                <div class='info-block-value'>
                    <a href='{{$pinballMachine->video_link}}' target='_blank'>{{$pinballMachine->video_link}}</a>
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Concept</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->concept_art}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Design</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->designer}}
                </div>
            </div>


            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Art</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->art_by}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Dots/Animation</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->dot_animations_by}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Mechanics</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->mechanics_by}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Music</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->music_by}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Sound</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->sound_by}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Software</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->software_by}}
                </div>
            </div>
        </div>
    </div>
    <hr/>
    <div class='row'>
        <div class='col-md-12'>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Marketing Slogan</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->marketing_slogan}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Toys</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->toys}}
                </div>
            </div>

            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Notable Features</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->notable_features}}
                </div>
            </div>


            <div class='info-block'>
                <div class='info-block-header'>
                    <strong>Notes</strong>
                </div>
                <div class='info-block-value'>
                    {{$pinballMachine->notes}}
                </div>
            </div>

        </div>
    </div>
</div>
@endsection
