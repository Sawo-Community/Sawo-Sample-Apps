<?php

use App\Http\Controllers\SawoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/home', function (Request $request) {
    return view('home');
})->name('home');

Route::get('/', [SawoController::class, 'index']);

Route::post('/sawo/login-callback', [SawoController::class, 'loginCallback']);
