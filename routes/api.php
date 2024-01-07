<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('chart', 'Api\V1\Admin\ChartsApiController@index')->name('api.chart');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
