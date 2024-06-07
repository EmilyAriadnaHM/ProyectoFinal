<?php

namespace App\Http\Controllers;

abstract class Controller
{
    protected $middleware = [
        // ...
        \Illuminate\Auth\Middleware\Authenticate::class,
    ];
}
