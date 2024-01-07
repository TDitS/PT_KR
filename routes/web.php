<?php
use App\Http\Controllers\MainController;
use App\Http\Controllers\ChartController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [MainController::class, 'main']);

Route::get('/stat', [ChartController::class, 'orderChart']);

Route::get('/auth', [HomeController::class, 'index']);

Route::get('/buy/{id}', [MainController::class, 'buy'])->name('buyProduct');

Route::post('/buy/check', [MainController::class, 'buy_check']);

Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');
