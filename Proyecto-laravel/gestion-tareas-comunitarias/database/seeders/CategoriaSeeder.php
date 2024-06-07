<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        DB::table('categorias')->insert([
            ['nombre' => 'Comunidad'],
            ['nombre' => 'Medio Ambiente'],
            ['nombre' => 'Educación'],
            ['nombre' => 'Salud'],
            ['nombre' => 'Cultura'],
        ]);
    }
}
