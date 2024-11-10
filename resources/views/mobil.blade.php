<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="page-title">Daftar Mobil {{ ucfirst($kategori) }}</h2>

                <!-- Tabs untuk memfilter jenis mobil -->
                <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori) ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori]) }}">Semua</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/MPV') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'MPV']) }}">MPV</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/SUV') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'SUV']) }}">SUV</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/Hatchback') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'Hatchback']) }}">Hatchback</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/Sedan') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'Sedan']) }}">Sedan</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/Commercial') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'Commercial']) }}">Commercial</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('mobil/'.$kategori.'/EV') ? 'active' : '' }}" href="{{ route('mobil.show', ['kategori' => $kategori, 'jenis' => 'EV']) }}">EV</a>
                    </li>
                </ul>

                <!-- List mobil -->
                <div class="row">
                    @forelse ($datamobil as $mobil)
                    <div class="col-md-4 mb-4">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="chart-box mb-3">
                                    <img src="{{ asset('assets/mobil/' . $mobil->foto) }}" class="card-img-top" alt="{{ $mobil->nama_mobil }}">
                                </div>
                                <h3 class="card-title">{{ $mobil->nama_mobil }}</h3>
                                
                                <div class="w-70 mx-auto">
                                    <div class="row align-items-center mb-2">
                                        <div class="col">
                                            <p class="mb-0">Harga</p>
                                            @if ($mobil->kategori === 'Rental')
                                                <span class="my-0 price-text">Rp {{ number_format($mobil->harga_rental, 0, ',', '.') }} /Hari</span>
                                            @else
                                                <span class="my-0 price-text">Rp {{ number_format($mobil->harga_jual, 0, ',', '.') }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mt-3">
                                <a class="btn btn-info" href="{{ url('deskripsi/' . $mobil->id_mobil) }}">Deskripsi</a>


                                @if ($mobil->kategori === 'Rental')
    <button class="btn btn-primary" onclick="addToCart(
        '{{ $mobil->id_mobil }}', 
        '{{ $mobil->nama_mobil }}', 
        '{{ $mobil->harga_rental }}', 
        1  
    )">Add +</button>
@else
<a href="{{ url('pembayaran/jual/' . $mobil->id_mobil) }}" class="btn btn-primary">Beli</a>

@endif

                                </div>

                            </div>
                        </div>
                    </div>
                    @empty
                    <div class="col-12">
                        <p class="text-muted">Tidak ada mobil tersedia.</p>
                    </div>
                    @endforelse
                </div>

            </div>
        </div>
    </div>
</main>

@if ($showCart)
    <!-- Floating Cart Button -->
    <a href="#" class="floating-cart" data-toggle="modal" data-target="#cartModal">
        <i class="fe fe-shopping-cart"></i>
        <span class="badge badge-danger" id="cartCount">0</span>
    </a>
@endif


<!-- Modal Cart -->
<div class="modal fade" id="cartModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Cart Rental</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div id="cartItems"></div>
                <div class="text-end">
                    <strong>Total: Rp. <span id="cartTotal">0</span></strong>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitRental()">Proceed to Checkout</button>
            </div>
        </div>
    </div>
</div>

<style>
.card-img-top {
    width: 100%;
    height: 270px;
    object-fit: contain;  
}

.price-text {
    font-weight: bold;
}

.floating-cart {
    position: fixed; /* Menggunakan fixed positioning */
    bottom: 20px; /* Jarak dari bawah */
    right: 20px; /* Jarak dari kanan */
    background-color: #007bff; /* Warna latar belakang tombol */
    color: white; /* Warna ikon */
    border-radius: 50%; /* Membuat tombol berbentuk bulat */
    width: 60px; /* Lebar tombol */
    height: 60px; /* Tinggi tombol */
    display: flex; /* Flex untuk center ikon */
    align-items: center; /* Center vertikal */
    justify-content: center; /* Center horizontal */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Bayangan */
    text-decoration: none; /* Menghapus garis bawah */
    z-index: 1000; /* Supaya di atas elemen lainnya */
}

.floating-cart .badge {
    position: absolute; /* Menggunakan absolute positioning */
    top: -5px; /* Jarak dari atas */
    right: -5px; /* Jarak dari kanan */
    padding: 5px 10px; /* Padding untuk badge */
    border-radius: 50%; /* Membuat badge berbentuk bulat */
    font-size: 12px; /* Ukuran font badge */
}
</style>

<script>

let cart = [];

function addToCart(id_mobil, nama_mobil, harga_rental, jumlah_hari) {
    // Cek apakah item sudah ada di cart
    const existingItemIndex = cart.findIndex(item => item.id_mobil === id_mobil);
    
    if (existingItemIndex !== -1) {
        // Jika sudah ada, update jumlah hari
        cart[existingItemIndex].jumlah_hari += jumlah_hari;
    } else {
        // Jika belum ada, tambahkan item baru
        cart.push({
            id_mobil: id_mobil,
            nama_mobil: nama_mobil,
            harga_rental: parseInt(harga_rental),
            jumlah_hari: jumlah_hari
        });
    }
    
    // Update tampilan cart
    updateCartDisplay();
    
    // Update badge count
    document.getElementById('cartCount').textContent = cart.length;
    
    // Tampilkan pesan sukses
    alert('Mobil berhasil ditambahkan ke cart!');
}

function updateCartDisplay() {
    const cartItems = document.getElementById('cartItems');
    const cartTotal = document.getElementById('cartTotal');
    let total = 0;
    
    cartItems.innerHTML = '';
    
    cart.forEach((item, index) => {
        const itemTotal = item.harga_rental * item.jumlah_hari;
        total += itemTotal;
        
        cartItems.innerHTML += `
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">${item.nama_mobil}</h5>
                    <div class="mb-2">
                        <label>Jumlah Hari:</label>
                        <input type="number" class="form-control" value="${item.jumlah_hari}" 
                               onchange="updateHari(${index}, this.value)" min="1">
                    </div>
                    <p class="card-text">
                        Harga Rental: Rp ${item.harga_rental.toLocaleString()}<br>
                        Subtotal: Rp ${itemTotal.toLocaleString()}
                    </p>
                    <button type="button" class="btn btn-danger btn-sm" onclick="removeFromCart(${index})">Hapus</button>
                </div>
            </div>
        `;
    });
    
    cartTotal.innerText = total.toLocaleString();
}

function updateHari(index, hari) {
    cart[index].jumlah_hari = parseInt(hari);
    updateCartDisplay();
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCartDisplay();
    document.getElementById('cartCount').textContent = cart.length;
}

function submitRental() {
    if (cart.length === 0) {
        alert('Cart masih kosong!');
        return;
    }

    // Kirim data cart ke server
    fetch('/save-cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
            items: cart
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {

            // Pastikan kode_cart valid
            if (data.kode_cart) {
                window.location.href = `/pembayaran-rental/${data.kode_cart}`;
            } else {
                alert('Kode cart tidak ditemukan');
            }
        } else {
            alert(data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Terjadi kesalahan saat checkout');
    });
}



</script>