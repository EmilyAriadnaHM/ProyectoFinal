<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ActividadSeeder extends Seeder
{
    public function run()
    {
        DB::table('actividades')->insert([
            [
                'nombre' => 'Limpieza del parque central',
                'descripcion' => 'Una actividad para limpiar el parque central de la ciudad.',
                'estado' => 'por_iniciar',
                'categoria_id' => 1,
            ],
            [
                'nombre' => 'Reforestación',
                'descripcion' => 'Plantación de árboles en áreas deforestadas.',
                'estado' => 'por_iniciar',
                'categoria_id' => 2,
            ],
            [
                'nombre' => 'Clases de inglés gratuitas',
                'descripcion' => 'Clases de inglés gratuitas para la comunidad.',
                'estado' => 'por_iniciar',
                'categoria_id' => 3,
            ],
        ]);
    }
}
