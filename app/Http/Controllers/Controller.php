<?php

namespace App\Http\Controllers;
use App\Models\Rental;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Dompdf\Dompdf;
use Dompdf\Options;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    
    public function dashboard()
{
    $id_level = session()->get('id_level');
    if (!$id_level) {
        return redirect()->route('login');
    }

    $model = new rental();
    $userId = session()->get('id_user');
    $username = session()->get('username');
    $data = [
        'username' => $username,
        'id_level' => $id_level
    ];

    // Log aktivitas
    $activityLog = [
        'id_user' => $userId,
        'activity' => 'Masuk Menu Dashboard',
        'time' => now()->toDateTimeString()
    ];
    $model->logActivity($activityLog);

    if ($id_level == 1) {
        // Admin (id_level = 1): melihat semua data rental dan jual
        $data['mobilRental'] = $model->getData('rental', ['status' => 'On-Going']);

        $data['mobilJual'] = $model->tampil('jual');
    } elseif ($id_level == 2) {
        // Pelanggan (id_level = 2): hanya melihat opsi rental dan beli
        $data['mobilRental'] = [];
        $data['mobilJual'] = [];
    }

    $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);
    echo view('header', $data);
    echo view('menu', $data);
    echo view('dashboard', $data);
    echo view('footer');
}

public function selesaikanPesanan($id_rental)
{
    $model = new Rental();
    
    // Ambil data rental untuk mendapatkan kode_cart
    $rental = DB::table('rental')->where('id_rental', $id_rental)->first();
    
    if ($rental) {
        $kodeCart = $rental->kode_cart;  // Ambil kode_cart dari tabel rental

        // Ambil data cart untuk mendapatkan id_mobil berdasarkan kode_cart
        $cart = DB::table('cart')->where('kode_cart', $kodeCart)->first();
        
        if ($cart) {
            $idMobil = $cart->id_mobil; // Ambil id_mobil dari tabel cart

            // Update status menjadi 'Selesai' di tabel 'rental'
            $updateData = ['status' => 'Selesai'];
            $model->edit('rental', ['id_rental' => $id_rental], $updateData);

            // Menambah stok mobil sebanyak 1 di tabel 'mobil' berdasarkan id_mobil
            DB::table('mobil')
                ->where('id_mobil', $idMobil)
                ->increment('stok', 1);
        }
    }

    // Redirect kembali ke dashboard dengan pesan sukses
    return redirect()->route('dashboard')->with('success', 'Pesanan telah diselesaikan.');
}



public function register()
{
    $model = new rental();
    $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);
    echo view('header',$data);
    echo view('register',$data);
    echo view('footer');
}

public function aksiregister(Request $request)
{
    $model = new Rental();

    $username = $request->input('username');
    $password = $request->input('password');
    $confirmPassword = $request->input('confirm_password');

    // Validasi bahwa password dan confirm password harus sama
    if ($password !== $confirmPassword) {
        return redirect()->back()->withErrors(['confirm_password' => 'Password dan konfirmasi password harus sama']);
    }

    $data = [
        'username' => $username,
        'password' => $password,
        'id_level' => 2 
    ];

    $model->tambah('user', $data);
    return redirect('login')->with('success', 'Registrasi berhasil, silakan login');
}



    public function login()
	{
        $model = new rental();
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);
		echo view('header',$data);
		echo view('login',$data);
        echo view('footer');
	}

    

    public function aksi_login(Request $request)
    {
        // Mengakses input dari request
        $name = $request->input('username');
        $pw = $request->input('password');
        $captchaResponse = $request->input('g-recaptcha-response');
        $backupCaptcha = $request->input('backup_captcha');
        
        // Secret key untuk Google reCAPTCHA
        $secretKey = '6LdFhCAqAAAAAM1ktawzN-e2ebDnMnUQgne7cy53'; 
        $recaptchaSuccess = false;
        
        // Membuat instance model
        $model = new Rental();  // Asumsi model Rental sudah di-import di bagian atas controller
        
        // Cek koneksi internet dari sisi server
        if ($this->isInternetAvailable()) {
            // Server terhubung ke internet, gunakan Google reCAPTCHA
            $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$captchaResponse");
            $responseKeys = json_decode($response, true);
            $recaptchaSuccess = $responseKeys["success"];
        }
        
        // Jika reCAPTCHA Google berhasil diverifikasi
        if ($recaptchaSuccess) {
            // Dapatkan pengguna berdasarkan username
            $user = $model->getWhere('user', ['username' => $name]);
            
            if ($user && $user->password === $pw) { // Verifikasi password tanpa hash
                // Set session
                session()->put('username', $user->username);
                session()->put('id_user', $user->id_user);
                session()->put('id_level', $user->id_level);
    
                return redirect()->to('dashboard');
            } else {
                return redirect()->to('login')->with('error', 'Invalid username or password.');
            }
        } else {
            $storedCaptcha = session()->get('captcha_code'); 
            
            if ($storedCaptcha !== null) {
                // Verifikasi backup CAPTCHA (offline)
                if ($storedCaptcha === $backupCaptcha) {
                    // CAPTCHA valid, lanjutkan login
                    $user = $model->getWhere('user', ['username' => $name]);
    
                    if ($user && $user->password === $pw) { // Verifikasi password tanpa hash
                        // Set session
                        session()->put('username', $user->username);
                        session()->put('id_user', $user->id_user);
                        session()->put('id_level', $user->id_level);
    
                        return redirect()->to('dashboard');
                    } else {
                        return redirect()->to('login')->with('error', 'Invalid username or password.');
                    }
                } else {
                    // CAPTCHA tidak valid
                    return redirect()->to('login')->with('error', 'Invalid CAPTCHA.');
                }
            } else {
                return redirect()->to('login')->with('error', 'CAPTCHA session is not set.');
            }
        }
    }
    
    private function isInternetAvailable()
    {

        $connected = @fsockopen("www.google.com", 80); 
        if ($connected){
            fclose($connected);
            return true;
        }
        return false;
    }
    

    public function generateCaptcha()
    {
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 6);
        session()->put('captcha_code', $code);
    
        $image = imagecreatetruecolor(120, 40);
        $bgColor = imagecolorallocate($image, 255, 255, 255);
        $textColor = imagecolorallocate($image, 0, 0, 0);
    
        imagefilledrectangle($image, 0, 0, 120, 40, $bgColor);
        imagestring($image, 5, 10, 10, $code, $textColor);
    
        ob_start();
        imagepng($image);
        $imageData = ob_get_contents();
        ob_end_clean();
    
        imagedestroy($image);
    
        return response($imageData)
                    ->header('Content-Type', 'image/png'); 
    }
    
    public function logout()
    {
        $model = new Rental();
        $id_user = session()->get('id_user');
        if ($id_user) {
            $activityLog = [
                'id_user' => $id_user,
                'activity' => 'Logout',
                'time' => now() 
            ];
            $model->logActivity($activityLog);
        }

        session()->flush();
        return redirect()->route('login'); 
    }

    public function setting()
    {
        $id_level = session()->get('id_level');	

        // Cek apakah pengguna sudah login
        if (!$id_level) {
            return redirect()->route('login'); // Redirect ke halaman login
        } elseif ($id_level != 1) {
            return redirect()->route('error404'); // Redirect ke halaman error
        } else {
            // Ambil data dari database
            $model = new rental();
            $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

            // Log aktivitas pengguna
            $id_user = session()->get('id_user');
            $activityLog = [
                'id_user' => $id_user,
                'activity' => 'Masuk Menu Setting',
                'time' => now()->toDateTimeString()
            ];
            $model->logActivity($activityLog);

            $data['id_level'] = $id_level; 

            echo view('header', $data);
            echo view('menu', $data);
            echo view('setting', $data);
            echo view('footer');
        }
    }

    public function editsetting(Request $request)
    {
        // Initialize the model
        $model = new rental();
        $namawebsite = $request->input('namaweb');
    
        $data = ['namawebsite' => $namawebsite];
    
        // Process upload for tab icon
        if ($request->hasFile('tab') && $request->file('tab')->isValid()) {
            $tab = $request->file('tab');
            $tabName = time() . '_' . $tab->getClientOriginalName(); // Save file with unique name
            $tab->move(public_path('img'), $tabName);
            $data['icontab'] = $tabName; // Save file name to database
        }
    
        // Process upload for menu icon
        if ($request->hasFile('menu') && $request->file('menu')->isValid()) {
            $menu = $request->file('menu');
            $menuName = time() . '_' . $menu->getClientOriginalName();
            $menu->move(public_path('img'), $menuName);
            $data['iconmenu'] = $menuName;
        }
    
        // Process upload for login icon
        if ($request->hasFile('login') && $request->file('login')->isValid()) {
            $login = $request->file('login');
            $loginName = time() . '_' . $login->getClientOriginalName();
            $login->move(public_path('img'), $loginName);
            $data['iconlogin'] = $loginName;
        }
    
        $where = ['id_setting' => 1];
        $model->edit('setting',$where, $data ); 
    
       
        return redirect()->route('setting')->with('success', 'Settings updated successfully!'); // Adjust as necessary
    }

    public function error404()
	{
			$model = new rental();
			$where = array('id_setting' => 1);
			$data['darren2'] = $model->getwhere('setting', $where);
			echo view('header', $data);
			echo view('error404');
	}
    
    public function showMobil(Request $request, $kategori = null, $jenis = null)
    {
        $id_level = session()->get('id_level');
    
        if (!$id_level) {
            return redirect()->route('login');
        }
    
        $model = new Rental();
    
        if ($jenis) {
            $data['datamobil'] = $model->getMobilByCategoryAndType('mobil', $kategori, $jenis);
        } else {
            $data['datamobil'] = $model->getMobilByCategory('mobil', $kategori);
        }
    
        $data['kategori'] = $kategori;
        $data['jenis'] = $jenis;
     
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);
    
        $data['showCart'] = ($kategori === 'rental'); 
        $data['id_level'] = $id_level; 

        $id_user = session()->get('id_user');
        $activityLog = [
            'id_user' => $id_user,
            'activity' => 'Melihat data mobil',
            'time' => now()->toDateTimeString()
        ];
        $model->logActivity($activityLog);
     
        if (empty($data['datamobil'])) {
            $data['message'] = 'Tidak ada mobil yang tersedia untuk kategori ini.';
        }
    
        echo view('header', $data);
        echo view('menu', $data);
        echo view('mobil', $data);
        echo view('footer');
    }

    public function saveCart(Request $request)
    {
        try {
            if (!$request->has('items')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data cart tidak ditemukan'
                ], 400);
            }
    
            $rental = new Rental();
            $kodeCart = 'CART-' . date('YmdHis') . rand(1000, 9999);
            
            $id_user = session('id_user');
    
            $items = $request->input('items');
          
            foreach ($items as $item) {
                $data = [
                    'kode_cart' => (string)$kodeCart, 
                    'id_mobil' => (int)$item['id_mobil'],
                    'id_user' => (int)$id_user, 
                    'jumlah' => (string)'1', 
                    'harga' => (string)$item['harga_rental'], 
                    'hari' => (string)$item['jumlah_hari'], 
                    'total' => (string)($item['harga_rental'] * $item['jumlah_hari']), 
                  
                ];
              
                $rental->tambah('cart', $data);
              
            }
    
            $rental->logActivity([
                'id_user' => $id_user,
                'activity' => 'Menyimpan cart dengan kode: ' . $kodeCart,
                'time' => now()
            ]);
    
            return response()->json([
                'success' => true,
                'kode_cart' => $kodeCart,
                'message' => 'Cart berhasil disimpan'
            ]);
    
        } catch (\Exception $e) {

            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage()
            ], 500);
        }
    }

   // Pembayaran untuk rental menggunakan kode_cart
   public function pembayaranRental($kode_cart)
   {
       $model = new Rental();
       $id_user = session()->get('id_user');
       $id_level = session()->get('id_level');
       
       // Cek apakah kode_cart ada
       if ($kode_cart) {
           $cartItems = $model->getCartWithMobil($kode_cart, $id_user);
           
           if ($cartItems->isEmpty()) {
               return redirect()->route('mobil.show', ['kategori' => 'Rental'])
                                ->with('error', 'Data cart tidak ditemukan');
           }
           
           $data = [
               'kode_cart' => $kode_cart,
               'cartItems' => $cartItems,
               'total' => $cartItems->sum('total'),
               'kategori' => 'Rental',
           ];
           
           // Log aktivitas
           $activity = 'Mengakses halaman pembayaran rental: ' . $kode_cart;
       } else {
           return redirect()->route('mobil.show', ['kategori' => 'Rental'])
                            ->with('error', 'Parameter tidak valid');
       }
       
       $activityLog = [
           'id_user' => $id_user,
           'activity' => $activity,
           'time' => now()->toDateTimeString()
       ];
       $model->logActivity($activityLog);
       
       // Menambahkan data setting
       $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);
       $data['id_level'] = $id_level; 
       
       echo view('header', $data);
       echo view('menu', $data);
       echo view('pembayaran', $data);
       echo view('footer');
   }
   

// Pembayaran untuk jual menggunakan id_mobil
public function pembayaranJual(Request $request, $id_mobil)
{
    $model = new Rental();
    $id_user = session()->get('id_user');
    $id_level = session()->get('id_level');
    
    $mobil = $model->getWhere('mobil', ['id_mobil' => $id_mobil, 'kategori' => 'jual']);
    
    if (empty($mobil)) {
        return redirect()->route('mobil.show', ['kategori' => 'Jual'])
                         ->with('error', 'Mobil tidak ditemukan');
    }
    
    $data = [
        'id_mobil' => $id_mobil,
        'mobil' => $mobil,
        'total' => $mobil->harga_jual,
        'darren2' => $model->getWhere('setting', ['id_setting' => 1]),
        'kategori' => 'Jual',
    ];
    
    // Log aktivitas
    $activity = 'Mengakses halaman pembayaran pembelian: ' . $id_mobil;
    
    $activityLog = [
        'id_user' => $id_user,
        'activity' => $activity,
        'time' => now()->toDateTimeString()
    ];
    $model->logActivity($activityLog);

    $data['id_level'] = $id_level; 
    
    echo view('header', $data);
    echo view('menu', $data);
    echo view('pembayaran', $data);
    echo view('footer');
}

    
    public function aksiKonfirmasiPembayaran(Request $request)
    {
        $model = new rental();
        
        // Ambil ID user dari session
        $idUser = session()->get('id_user');
        
        // Data yang dikirim dari form
        $nama = $request->input('nama_lengkap');
        $noTelp = $request->input('no_telpon');
        $noKtp = $request->input('no_ktp');
        $kodeCart = $request->input('kode_cart');
        
        // Cek apakah kode_cart valid di tabel cart
        $cartItem = DB::table('cart')
            ->where('kode_cart', $kodeCart)
            ->where('id_user', $idUser)
            ->first();
        
        if (!$cartItem) {
            return redirect()->back()->withErrors(['Kode cart tidak valid atau tidak ditemukan']);
        }
        
        // Ambil jumlah_hari dan total dari cart
        $jumlahHari = $cartItem->hari;
        $total = $cartItem->total;
        $idMobil = $cartItem->id_mobil;  // Ambil id_mobil dari cart
        
        // Set status dan tanggal
        $status = 'On-Going';
        $tanggal = date('Y-m-d');
        
        // Proses upload bukti pembayaran
        if ($request->hasFile('bukti_pembayaran')) {
            $buktiBayar = $request->file('bukti_pembayaran');
            $buktiBayarName = time() . '_' . $buktiBayar->getClientOriginalName();
            $buktiBayar->move(public_path('assets/bukti_pembayaran'), $buktiBayarName);
        } else {
            $buktiBayarName = null;
        }
        
        // Data yang akan diinsert ke tabel 'rental'
        $data = [
            'id_user' => $idUser,
            'jumlah_hari' => $jumlahHari,
            'status' => $status,
            'tanggal' => $tanggal,
            'nama' => $nama,
            'no_telp' => $noTelp,
            'no_ktp' => $noKtp,
            'bukti_bayar' => $buktiBayarName,
            'total' => $total,
            'kode_cart' => $kodeCart,
        ];
        
        // Insert data ke tabel 'rental'
        $model->tambah('rental', $data);
        
        // Mengurangi stok mobil sebanyak 1 di tabel 'mobil'
        DB::table('mobil')
            ->where('id_mobil', $idMobil)
            ->decrement('stok', 1);
        
        // Redirect ke halaman dashboard
        return redirect('dashboard')->with('success', 'Konfirmasi pembayaran berhasil!');
    }
    
    public function aksiKonfirmasiPembayaranJual(Request $request, $id_mobil)
    {
        $model = new Rental();
    
        // Ambil ID user dari session
        $idUser = session()->get('id_user');
    
        // Data yang dikirim dari form
        $nama = $request->input('nama_lengkap');
        $noTelp = $request->input('no_telpon');
        $noKtp = $request->input('no_ktp');
    
        // Ambil informasi mobil yang dijual
        $mobil = DB::table('mobil')->where('id_mobil', $id_mobil)->first();
        if (!$mobil) {
            return redirect()->back()->withErrors(['Mobil tidak ditemukan']);
        }
    
        // Tanggal pembelian
        $tanggal = date('Y-m-d');
        
        // Proses upload bukti pembayaran
        if ($request->hasFile('bukti_pembayaran')) {
            $buktiBayar = $request->file('bukti_pembayaran');
            $buktiBayarName = time() . '_' . $buktiBayar->getClientOriginalName();
            $buktiBayar->move(public_path('assets/bukti_pembayaran'), $buktiBayarName);
        } else {
            $buktiBayarName = null;
        }
    
        // Data yang akan diinsert ke tabel 'jual'
        $data = [
            'id_user' => $idUser,
            'id_mobil' => $id_mobil,
            'tanggal' => $tanggal,
            'nama' => $nama,
            'no_telp' => $noTelp,
            'no_ktp' => $noKtp,
            'bukti_bayar' => $buktiBayarName,
            'total' => $mobil->harga_jual
        ];
    
        // Insert data ke tabel 'jual'
        $model->tambah('jual', $data);
    
        // Kurangi stok mobil di tabel 'mobil' sebesar 1
        DB::table('mobil')
            ->where('id_mobil', $id_mobil)
            ->decrement('stok', 1);
    
        // Redirect ke halaman dashboard
        return redirect('dashboard')->with('success', 'Konfirmasi pembayaran berhasil!');
    }
    
    
    
    
public function stok()
{
    $id_level = session()->get('id_level');	

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1) {
        return redirect()->route('error404');
    } else {
    
        $model = new rental();
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

        $data['mobil'] = $model->tampil2('mobil');

        $id_user = session()->get('id_user');
        $activityLog = [
            'id_user' => $id_user,
            'activity' => 'Lihat Stok',
            'time' => now()->toDateTimeString()
        ];
        $model->logActivity($activityLog);
        $data['id_level'] = $id_level; 

        echo view('header', $data);
        echo view('menu', $data);
        echo view('stok', $data);
        echo view('footer');
    }
}

public function addstok()
{
    $id_level = session()->get('id_level');    

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1) {
        return redirect()->route('error404');
    } else {
        $model = new rental();
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

        // Ambil enum 'jenis' dari tabel mobil
        $data['jenis_mobil'] = DB::select(DB::raw('SHOW COLUMNS FROM mobil WHERE Field = "jenis"'))[0]->Type;
        preg_match('/enum\((.*)\)$/', $data['jenis_mobil'], $matches);
        $data['jenis_mobil'] = explode(',', str_replace("'", "", $matches[1]));
        $data['id_level'] = $id_level; 

        echo view('header', $data);
        echo view('menu', $data);
        echo view('addstok', $data);
        echo view('footer');
    }
}

public function aksiaddstok(Request $request)
{

    $model = new rental();

    $namaMobil = $request->input('namamobil');
    $merek = $request->input('merek');
    $jenis = $request->input('jenis');
    $kategori = $request->input('kategori');
    $stok = $request->input('stok');
    $tahun = $request->input('tahun');
    $tipe = $request->input('tipe');
    $deskripsi = $request->input('deskripsi');

    $hargaRental = $kategori === 'Rental' ? $request->input('harga_rental') : null;
    $hargaJual = $kategori === 'Jual' ? $request->input('harga_jual') : null;

    if ($request->hasFile('foto')) {
        $foto = $request->file('foto');
        $fotoName = time() . '_' . $foto->getClientOriginalName();
        $foto->move(public_path('assets/mobil'), $fotoName);
    } else {
        $fotoName = null; 
    }

    $data = [
        'nama_mobil' => $namaMobil,
        'merek' => $merek,
        'jenis' => $jenis,
        'kategori' => $kategori,
        'stok' => $stok,
        'tahun' => $tahun,
        'tipe' => $tipe,
        'deskripsi' => $deskripsi,
        'foto' => $fotoName,
        'harga_rental' => $hargaRental,
        'harga_jual' => $hargaJual,
        'status' => 'Tersedia'
    ];

    $model->tambah('mobil', $data);
    return redirect('stok');
}

public function editstok($id)
{
    $id_level = session()->get('id_level');

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1) {
        return redirect()->route('error404');
    } else {
        $model = new Rental();
        // Ambil pengaturan dari tabel setting
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

        $data['mobil'] = $model->getWhere('mobil', ['id_mobil' => $id]);
        if (empty($data['mobil'])) {
            return redirect()->route('error404'); 
        }

      
        $data['jenis_mobil'] = DB::select(DB::raw('SHOW COLUMNS FROM mobil WHERE Field = "jenis"'))[0]->Type;
        preg_match('/enum\((.*)\)$/', $data['jenis_mobil'], $matches);
        $data['jenis_mobil'] = explode(',', str_replace("'", "", $matches[1]));

        $data['id_level'] = $id_level; 
        echo view('header', $data);
        echo view('menu', $data);
        echo view('editstok', $data); 
        echo view('footer');
       }
    }

    public function updateStok(Request $request, $id)
    {
        $model = new Rental();
        
        // Ambil data dari request
        $nama_mobil = $request->input('namamobil');
        $merek = $request->input('merek');
        $jenis = $request->input('jenis');
        $kategori = $request->input('kategori');
        $harga_rental = $request->input('harga_rental');
        $harga_jual = $request->input('harga_jual');
        $stok = $request->input('stok');
        $tahun = $request->input('tahun');
        $tipe = $request->input('tipe');
        $deskripsi = $request->input('deskripsi');
        $foto = $request->file('foto');

        // Siapkan data untuk update
        $data = [
            'nama_mobil' => $nama_mobil,
            'merek' => $merek,
            'jenis' => $jenis,
            'kategori' => $kategori,
            'stok' => $stok,
            'tahun' => $tahun,
            'tipe' => $tipe,
            'deskripsi' => $deskripsi,
        ];

        // Tambahkan harga berdasarkan kategori
        if ($kategori === 'Rental') {
            $data['harga_rental'] = $harga_rental;
        } elseif ($kategori === 'Jual') {
            $data['harga_jual'] = $harga_jual;
        }

        // Jika ada file foto yang diupload, proses upload
        if ($foto) {
            $fotoPath = $foto->store('mobil', 'assets'); 
            $data['foto'] = $fotoPath;
        }

        // Simpan perubahan ke database
        $model->edit('mobil', ['id_mobil' => $id], $data);

        return redirect('stok');
    }

    public function deleteStok($id)
    {
        $model = new Rental();
        $id_user = session()->get('id_user');

        $data = [
            'deleted_at' => date('Y-m-d H:i:s'),
            'deleted_by' => $id_user
        ];

        $model->edit('mobil', ['id_mobil' => $id], $data);

        return redirect('stok');
    }

    public function restoredeletedStok()
{
    $id_level = session()->get('id_level');

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1) {
        return redirect()->route('error404');
    } else {
        $model = new Rental();

        // Ambil pengaturan dari tabel setting
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

        // Ambil mobil yang memiliki deleted_at IS NOT NULL
        $data['deletedMobil'] = DB::table('mobil')
                            ->whereNotNull('deleted_at')
                            ->get(); // Menggunakan query builder Laravel

$data['id_level'] = $id_level; 
        echo view('header', $data);
        echo view('menu', $data);
        echo view('restoredeletedstok', $data);
        echo view('footer');
    }
}

public function actrestoredeletedstok($id)
    {
        $model = new Rental();

        $data = [
            'deleted_at' => null,
            'deleted_by' => null,
          
        ];

        $model->edit('mobil', ['id_mobil' => $id], $data);

        return redirect('restoredeletedstok');
    }

    public function logactivity()
{
    // Check user level from session
    $id_level = Session::get('id_level');

    // Redirect if the user is not logged in or not an admin
    if (!$id_level) {
        return redirect()->to('home/login');
    } elseif ($id_level != 1) {
        return redirect()->to('home/error404');
    }

    // Fetch settings data
    $model = new rental();
    $where = array('id_setting' => 1);
    $data['darren2'] = $model->getwhere('setting', $where);
    $data['logs'] = $model->getLogData();

    $data['id_level'] = $id_level; 

    
    echo view('header',$data);
    echo view('menu',$data);
    echo view('logactivity',$data);
    echo view('footer');
}
    
public function deskripsi($id)
{
    // Check user level from session
    $id_level = Session::get('id_level');

    // Redirect if the user is not logged in or not an admin
    if (!$id_level) {
        return redirect()->to('home/login');
    }

    // Fetch settings data
    $model = new rental();
    $where = array('id_mobil' => $id);
    $data['mobil'] = $model->getwhere('mobil', $where);

    $where = array('id_setting' => 1);
    $data['darren2'] = $model->getwhere('setting', $where);
    $data['id_level'] = $id_level; 
    echo view('header',$data);
    echo view('menu',$data);
    echo view('deskripsi',$data);
    echo view('footer');
}

public function user()
{
    $id_level = session()->get('id_level');	

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1) {
        return redirect()->route('error404');
    } else {
    
        $model = new rental();
        $data['darren2'] = $model->getWhere('setting', ['id_setting' => 1]);

        $data['mobil'] = $model->join2('user','level','user.id_level','level.id_level');

        $id_user = session()->get('id_user');
        $activityLog = [
            'id_user' => $id_user,
            'activity' => 'Lihat Data User',
            'time' => now()->toDateTimeString()
        ];
        $model->logActivity($activityLog);

        $data['id_level'] = $id_level; 


        echo view('header', $data);
        echo view('menu', $data);
        echo view('user', $data);
        echo view('footer');
    }
}

public function showRental()
{
    $id_level = session()->get('id_level');

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1 && $id_level != 2) {
        return redirect()->route('error404');
    }

    $model = new Rental();

    // Mengambil data transaksi rental dengan join ke tabel mobil
    $data['transaksiRental'] = $model->getTransaksiRental();

    // Log aktivitas pengguna
    $id_user = session()->get('id_user');
    $activityLog = [
        'id_user' => $id_user,
        'activity' => 'Lihat Transaksi Rental',
        'time' => now()->toDateTimeString()
    ];
    $model->logActivity($activityLog);

    $where = array('id_setting' => 1);
    $data['darren2'] = $model->getwhere('setting', $where);
    $data['id_level'] = $id_level;

    echo view('header', $data);
    echo view('menu', $data);
    echo view('transaksi', ['transaksi' => $data['transaksiRental'], 'kategori' => 'Rental'], $data);
    echo view('footer');
}

public function showJual()
{
    $id_level = session()->get('id_level');

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1 && $id_level != 2) {
        return redirect()->route('error404');
    }

    $model = new Rental();

    // Mengambil data transaksi jual dengan join ke tabel mobil
    $data['transaksiJual'] = $model->getTransaksiJual();

    // Log aktivitas pengguna
    $id_user = session()->get('id_user');
    $activityLog = [
        'id_user' => $id_user,
        'activity' => 'Lihat Transaksi Jual',
        'time' => now()->toDateTimeString()
    ];
    $model->logActivity($activityLog);

    $where = array('id_setting' => 1);
    $data['darren2'] = $model->getwhere('setting', $where);
    $data['id_level'] = $id_level;

    echo view('header', $data);
    echo view('menu', $data);
    echo view('transaksi', ['transaksi' => $data['transaksiJual'], 'kategori' => 'Jual'], $data);
    echo view('footer');
}

public function generateReport(Request $request)
{
    $id_level = session()->get('id_level');

    if (!$id_level) {
        return redirect()->route('login');
    } elseif ($id_level != 1 && $id_level != 2) {
        return redirect()->route('error404');
    }

    $kategori = request()->get('kategori');
    $startDate = request()->get('start_date');
    $endDate = request()->get('end_date');

    $data = [
        'kategori' => $kategori,
        'start_date' => $startDate,
        'end_date' => $endDate,
    ];

    // Ambil data sesuai dengan filter
    $model = new Rental();
    if ($kategori == 'Rental') {
        $data['transaksi'] = $model->getTransaksiRentalFiltered($startDate, $endDate);
    } else {
        $data['transaksi'] = $model->getTransaksiJualFiltered($startDate, $endDate);
    }

    // Menyimpan data untuk tampilan PDF
    $pdfContent = view('laporan', $data)->render();

    // Inisialisasi Dompdf
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isPhpEnabled', true);
    $dompdf = new Dompdf($options);
    $dompdf->loadHtml($pdfContent);
    $dompdf->render();

    // Unduh PDF
    return $dompdf->stream('laporan_keuangan.pdf');
}



}

