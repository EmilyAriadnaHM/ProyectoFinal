<?php

use App\Http\Controllers\ActividadController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/actividades', [ActividadController::class, 'index'])->name('api.actividades.index');
Route::post('/actividades', [ActividadController::class, 'store'])->name('api.actividades.store');
Route::get('/actividades/{id}', [ActividadController::class, 'show'])->name('api.actividades.show');
Route::put('/actividades/{id}', [ActividadController::class, 'update'])->name('api.actividades.update');
Route::delete('/actividades/{id}', [ActividadController::class, 'destroy'])->name('api.actividades.destroy');


Route::post('/register', [AuthController::class, 'register'])->name('api.register');
Route::post('/login', [AuthController::class, 'login'])->name('api.login');

Route::apiResource('/users', UserController::class)->names('users');

Route::get('/register', function () {
    return view('register');
})->name('register');

Route::get('/login', function () {
    return view('login');
})->name('login');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware('auth')->name('dashboard');

Route::get('/', function () {
    return view('welcome');
})->name('welcome');


Route::resource('web/actividades', ActividadController::class)->names('web.actividades');
