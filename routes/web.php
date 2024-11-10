<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller;

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

// base
Route::get('/dashboard',  [Controller::class, 'dashboard'])->name('dashboard');
Route::get('/generateCaptcha', [Controller::class, 'generateCaptcha'])->name('generateCaptcha');
Route::get('/logout', [Controller::class, 'logout']);
Route::get('/error404', [Controller::class, 'error404'])->name('error404');

// page
Route::get('/login',  [Controller::class, 'login'])->name('login');
Route::get('/setting', [Controller::class, 'setting'])->name('setting');
Route::get('/mobil/{kategori}/{jenis?}', [Controller::class, 'showMobil'])->name('mobil.show');
Route::get('/stok', [Controller::class, 'stok'])->name('stok');
Route::get('/addstok', [Controller::class, 'addstok'])->name('addstok');
Route::get('/editstok/{id}', [Controller::class, 'editstok'])->name('mobil.editstok');
Route::get('/restoredeletedstok', [Controller::class, 'restoredeletedstok'])->name('restoredeletedstok');
Route::get('/logactivity', [Controller::class, 'logactivity'])->name('logactivity');
Route::get('/deskripsi/{id}', [Controller::class, 'deskripsi'])->name('deskripsi');
Route::get('/pembayaran-rental/{kode_cart}', [Controller::class, 'pembayaranRental'])->name('pembayaran.show');
Route::get('/pembayaran/jual/{id_mobil}', [Controller::class, 'pembayaranJual'])->name('pembayaran.jual');
Route::get('/user', [Controller::class, 'user'])->name('user');
Route::get('/transaksi/rental/', [Controller::class, 'showRental'])->name('transaksi.rental');
Route::get('/transaksi/jual/', [Controller::class, 'showJual'])->name('transaksi.jual');
Route::get('/laporan-keuangan', [Controller::class, 'generateReport'])->name('laporan.generate');
Route::get('/register', [Controller::class, 'register'])->name('register');


// aksi
Route::post('/aksi_login', [Controller::class, 'aksi_login']);
Route::post('/editsetting', [Controller::class, 'editsetting']);
Route::post('/aksiaddstok', [Controller::class, 'aksiaddstok']);
Route::post('/updatestok/{id}', [Controller::class, 'updateStok']);
Route::delete('/deletestok/{id}', [Controller::class, 'deletestok']); 
Route::post('/actrestoredeletedstok/{id}', [Controller::class, 'actrestoredeletedstok']);
Route::post('/save-cart', [Controller::class, 'saveCart'])->name('save-cart');
Route::post('/konfirmasi-pembayaran', [Controller::class, 'aksiKonfirmasiPembayaran']);
Route::post('/konfirmasi-pembayaran-jual/{id_mobil}', [Controller::class, 'aksiKonfirmasiPembayaranJual']);
Route::get('/selesaikanPesanan/{id_rental}', [Controller::class, 'selesaikanPesanan'])->name('rental.selesaikan');
Route::post('/aksi_register', [Controller::class, 'aksiregister'])->name('aksi_register');





