<?php
/*
use App\Http\Controllers\ActividadController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/actividades', [ActividadController::class, 'index'])->name('api.actividades.index');
Route::post('/actividades', [ActividadController::class, 'store'])->name('api.actividades.store');
Route::get('/actividades/{id}', [ActividadController::class, 'show'])->name('api.actividades.show');
Route::put('/actividades/{id}', [ActividadController::class, 'update'])->name('api.actividades.update');
Route::delete('/actividades/{id}', [ActividadController::class, 'destroy'])->name('api.actividades.destroy');

// Rutas de autenticación
Route::post('/api/register', [AuthController::class, 'register']);
Route::post('/api/login', [AuthController::class, 'login']);
Route::post('/users', [UserController::class, 'register']);
Route::apiResource('/users', UserController::class)->names('users');
Route::apiResource('/api/register', UserController::class)->names('register');

Route::apiResource('/api/login', UserController::class)->names('login');

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
});

Route::resource('actividades', ActividadController::class)->names('web.actividades');

Route::post('/api/register', [AuthController::class, 'register'])->name('register');
Route::post('/api/login', [AuthController::class, 'login'])->name('login');

Route::post('/api/register', [AuthController::class, 'register']);
Route::post('/api/login', [AuthController::class, 'login']);

*/