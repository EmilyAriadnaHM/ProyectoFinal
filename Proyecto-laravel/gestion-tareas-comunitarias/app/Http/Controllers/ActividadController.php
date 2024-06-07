<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Actividad;

class ActividadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $actividades = Actividad::with('categoria')->get();
        return response()->json($actividades);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $actividad = Actividad::create([
            'nombre' => $request->input('nombre'),
            'descripcion' => $request->input('descripcion'),
            'estado' => $request->input('estado'),
            'categoria_id' => $request->input('categoria_id'),
        ]);

        return response()->json($actividad);
    }

    /**
     * Display the specified resource.
     */
    public function show(Actividad $actividad)
    {
        return response()->json($actividad);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Actividad $actividad)
    {
        $actividad->update([
            'nombre' => $request->input('nombre'),
            'descripcion' => $request->input('descripcion'),
            'estado' => $request->input('estado'),
            'categoria_id' => $request->input('categoria_id'),
        ]);

        return response()->json($actividad);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Actividad $actividad)
    {
        $actividad->delete();
        return response()->json("Actividad eliminada");
    }
}
