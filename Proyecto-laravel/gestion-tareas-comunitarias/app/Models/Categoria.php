<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Actividad;

class Categoria extends Model
{
    use HasFactory;

    protected $fillable = ['nombre'];

    public function actividades()
    {
        return $this->hasMany(Actividad::class, 'categoria_id');
    }
}
