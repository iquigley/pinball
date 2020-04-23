<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function() { return view('home'); });

Route::get("/pinball/", "PinballMachineController@index");
Route::get("/pinball/show/{id}", "PinballMachineController@show");
Route::get('/pinball/delete/{id}', "PinballMachineController@destroy");
Route::get('/pinball/create/', "PinballMachineController@create");
Route::post('/pinball/store/', "PinballMachineController@store");
Route::get('/pinball/edit/{id}', 'PinballMachineController@edit');
Route::post('/pinball/update/{id}', 'PinballMachineController@update');