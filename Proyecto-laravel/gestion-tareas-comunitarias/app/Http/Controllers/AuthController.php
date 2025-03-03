<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use OpenApi\Annotations as OA; 

class AuthController extends Controller
{
    public function register(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);

    $token = $user->createToken('auth_token')->plainTextToken;

    return response()->json([
        'message' => 'Usuario registrado con éxito',
        'token' => $token,
        'user' => $user
    ], 201);
}


    public function login(Request $request)
    {
       $screndencials = $request -> only ("email", "password");

       if (Auth::attempt($screndencials)) {
        return $this->handleLogin($request);
       }
       return response ()->json (["message" => "credenciales invalidas"], 401);
    }

    private function handlelogin(Request $request)
    {   
        $user = auth()->user();
        $token = $user ->createToken('auth_token');

        return response ()->json([
            'token'=>$token->plainTextToken,
            'user' => $user


        ]);

    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response ()->json([
            'messege' => 'cierre de sesion exitoso'

        ]);
    }
}
