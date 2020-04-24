<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PinballMachine as PinballMachine;
use App\Manufacturer as Manufacturer;
use App\MPU as MPU;
use App\PinballType as PinballType;
use App\Theme as Theme;
use App\Artist as Artist;

class PinballMachineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pinballMachines = PinballMachine::loadAllRelatedObjects();
        return view('pinball_machines.index')->with('pinballMachines', $pinballMachines);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $manufacturers = Manufacturer::all();
        $mpus = MPU::all();
        $types = PinballType::all();
        $themes = Theme::all();
        $artists = Artist::all();
        return view('pinball_machines.create')->with('manufacturers', $manufacturers)
                                              ->with('mpus', $mpus)
                                              ->with('types', $types)
                                              ->with('themes', $themes)
                                              ->with('artists', $artists);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id = PinballMachine::createPinballMachine($request);
        return redirect()->action('PinballMachineController@show', [$id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pinballMachine = PinballMachine::loadRelatedObjectById($id);
        $themes = PinballMachine::loadPinballThemes($id);
        return view('pinball_machines.show')->with('pinballMachine', $pinballMachine)->with('themes',$themes);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pinballMachine = PinballMachine::loadRelatedObjectById($id);
        $manufacturers = Manufacturer::all();
        $mpus = MPU::all();
        $types = PinballType::all();
        $themes = Theme::all();
        $artists = Artist::all();
        $images = \App\PinballImage::loadImagesForPinballMachine($pinballMachine);
        return view('pinball_machines.edit')->with('pinball', $pinballMachine)
                                            ->with('manufacturers', $manufacturers)
                                            ->with('mpus', $mpus)
                                            ->with('types', $types)
                                            ->with('themes', $themes)
                                            ->with('artists', $artists)
                                            ->with('images', $images);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        PinballMachine::updatePinballMachine($id, $request);
        return redirect()->action('PinballMachineController@show', [$id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        PinballMachine::deletePinballMachine($id);
        return redirect()->action('PinballMachineController@index');
    }
}
