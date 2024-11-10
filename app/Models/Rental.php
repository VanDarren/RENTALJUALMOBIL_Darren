<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Rental extends Model
{

    public function sqlquery($query)
    {
        return DB::select(DB::raw($query));
    }

    public function tampil($table)
    {
        $this->setTable($table);
        return DB::table($this->table)->get();
    }

    public function tambah($table, $data)
    {
        $this->setTable($table); 
        return DB::table($this->table)->insert($data); 
    }

    public function getWhere($table, $where)
{
    return DB::table($table)->where($where)->first();
}

public function getData($table, $where = null)
{
    // Set tabel yang akan digunakan
    $this->setTable($table);
    
    // Jika ada kondisi, tambahkan klausa where
    if ($where) {
        return DB::table($this->table)->where($where)->get();
    }
    
    // Jika tidak ada kondisi, ambil semua data
    return DB::table($this->table)->get();
}


public function getCartWithMobil($kodeCart, $idUser)
    {
        return DB::table('cart')
            ->join('mobil', 'cart.id_mobil', '=', 'mobil.id_mobil')
            ->select('cart.*', 'mobil.nama_mobil')
            ->where('cart.kode_cart', $kodeCart)
            ->where('cart.id_user', $idUser)
            ->get();
    }

public function getMobilByCategoryAndType($table, $kategori, $jenis)
{
    return DB::table($table)
             ->where('kategori', $kategori)
             ->where('jenis', $jenis)
             ->whereNull('deleted_at') 
             ->where('stok', '>', 0) // Filter mobil dengan stok lebih dari 0
             ->get(); // Mengembalikan koleksi data
}

public function getMobilByCategory($table, $kategori)
{
    return DB::table($table)
        ->where('kategori', $kategori)
        ->whereNull('deleted_at') 
        ->where('stok', '>', 0)
        ->get();
}


public function edit($table, $where, $data)
{
    $this->setTable($table);
    return DB::table($this->table)->where($where)->update($data);
}

public function hapus($table, $where)
{
    $this->setTable($table);
    return DB::table($this->table)->where($where)->delete();
}

    public function tampil2($tabel)
    {
        return DB::table($tabel)
                 ->whereNull('deleted_at') 
                 ->get();
    }

    public function join($table1, $table2, $on1, $on2) {
        $this->setTable($table1);
        return DB::table($this->table)
                    ->join($table2, $on1, '=', $on2) 
                    ->get(); 
    }

    public function join2($table1, $table2, $on1, $on2) {
        $this->setTable($table1);
        return DB::table($this->table)
                    ->join($table2, $on1, '=', $on2)
                    ->whereNull('deleted_at')  
                    ->get(); 
    }


    public function getLogData()
    {
        return DB::table('log')
                 ->select('log.*', 'user.username')
                 ->join('user', 'log.id_user', '=', 'user.id_user')
                 ->orderBy('time', 'DESC')
                 ->get();
    }

    public function logActivity($data)
    {
        return DB::table('log')->insert($data);
    }

  
    public function getBackupData()
    {
        return DB::table('user_backup')->get();
    }
  
    public function getProductById($id)
    {
        return DB::table('user')->where('id_user', $id)->first();
    }

    public function getMobilInCart($ids)
    {
        return DB::table('mobil')->whereIn('id_mobil', $ids)->get();
    }

    public function saveCartItem($data)
{
    return DB::table('cart')->insert($data);
}

public function generateKodeCart()
{
    return 'CART-' . date('YmdHis') . rand(1000, 9999);
}

public function getTransaksiRental()
{
    return DB::table('rental')
        ->join('cart', 'rental.kode_cart', '=', 'cart.kode_cart')
        ->join('mobil', 'cart.id_mobil', '=', 'mobil.id_mobil')
        ->select('rental.*', 'mobil.nama_mobil')
        ->get();
}

public function getTransaksiJual()
{
    return DB::table('jual')
        ->join('mobil', 'jual.id_mobil', '=', 'mobil.id_mobil')
        ->select('jual.*', 'mobil.nama_mobil')
        ->get();
}

public function getTransaksiRentalFiltered($startDate = null, $endDate = null)
{
    $query = DB::table('rental')
        ->join('cart', 'rental.kode_cart', '=', 'cart.kode_cart')
        ->join('mobil', 'cart.id_mobil', '=', 'mobil.id_mobil')
        ->select('rental.*', 'mobil.nama_mobil');

    // Menambahkan filter tanggal jika ada
    if ($startDate && $endDate) {
        $query->whereBetween('rental.tanggal', [$startDate, $endDate]);
    }

    return $query->get();
}


// Fungsi untuk mendapatkan transaksi jual yang difilter
public function getTransaksiJualFiltered($startDate, $endDate)
{
    $query = DB::table('jual')
        ->join('mobil', 'jual.id_mobil', '=', 'mobil.id_mobil')
        ->select('jual.*', 'mobil.nama_mobil');

    if ($startDate) {
        $query->where('jual.tanggal', '>=', $startDate);
    }

    if ($endDate) {
        $query->where('jual.tanggal', '<=', $endDate);
    }

    return $query->get();
}

    
}

