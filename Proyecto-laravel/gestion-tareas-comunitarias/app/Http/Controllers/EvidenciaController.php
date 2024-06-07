<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Evidencia;

class EvidenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $evidencias = Evidencia::all();
        return response()->json($evidencias);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $evidencia = Evidencia::create([
            'user_id' => $request->input('user_id'),
            'actividad_id' => $request->input('actividad_id'),
            'imagen' => $request->input('imagen'),
        ]);

        return response()->json($evidencia);
    }

    /**
     * Display the specified resource.
     */
    public function show(Evidencia $evidencia)
    {
        return response()->json($evidencia);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Evidencia $evidencia)
    {
        $evidencia->update([
            'user_id' => $request->input('user_id'),
            'actividad_id' => $request->input('actividad_id'),
            'imagen' => $request->input('imagen'),
        ]);

        return response()->json($evidencia);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Evidencia $evidencia)
    {
        $evidencia->delete();
        return response()->json("Evidencia eliminada");
    }
}
