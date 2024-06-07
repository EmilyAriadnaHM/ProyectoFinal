<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tarea;

class TareaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $tareas = Tarea::with('categorias')->get();
        return response()->json($tareas);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $tarea = Tarea::create([
            'titulo' => $request->input('titulo'),
            'descripcion' => $request->input('descripcion'),
            'categoria_id' => $request->input('categoria_id'),
            'estado' => true
        ]);

        return response()->json($tarea);
    }

    /**
     * Display the specified resource.
     */
    public function show(Tarea $tarea)
    {
        $tarea->load('categoria');
        return response()->json($tarea);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Tarea $tarea)
    {
        $tarea->update([
            'titulo' => $request->input('titulo'),
            'descripcion' => $request->input('descripcion'),
            'categoria_id' => $request->input('categoria_id'),
            'estado' => $request->input('estado')
        ]);

        return response()->json($tarea);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Tarea $tarea)
    {
        $tarea->delete();
        return response()->json("Tarea eliminada");
    }

}
