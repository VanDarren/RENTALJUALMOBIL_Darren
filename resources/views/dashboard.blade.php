<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center mb-2">
                    <div class="col">
                        <h2 class="h5 page-title">Selamat Datang, {{ $username }}!</h2>
                    </div>
                </div>

                @if($id_level == 1)
                    <!-- Tampilan untuk admin -->
                    <h2 class="page-title mb-3">Mobil yang Sedang Dirental</h2>
                    <div class="row">
                        @if(count($mobilRental) > 0)
                            @foreach($mobilRental as $rental)
                                <div class="col-md-4">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <h5 class="card-title">{{ $rental->nama }}</h5>
                                            <p class="card-text">Tanggal: {{ $rental->tanggal }}</p>
                                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#detailModalRental{{ $rental->id_rental }}">Lihat Detail</button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal Detail Rental -->
                                <div class="modal fade" id="detailModalRental{{ $rental->id_rental }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabelRental" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="detailModalLabelRental">Detail Rental - {{ $rental->nama }}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Data detail rental -->
                                                <p><strong>Kode Cart:</strong> {{ $rental->kode_cart }}</p>
                                                <p><strong>Jumlah Hari:</strong> {{ $rental->jumlah_hari }}</p>
                                                <p><strong>Status:</strong> {{ $rental->status }}</p>
                                                <p><strong>Tanggal Rental:</strong> {{ $rental->tanggal }}</p>
                                                <p><strong>No. Telp:</strong> {{ $rental->no_telp }}</p>
                                                <p><strong>No. KTP:</strong> {{ $rental->no_ktp }}</p>
                                                <p><strong>Bukti Pembayaran:</strong></p>
                                                <img src="{{ asset('assets/bukti_pembayaran/' . $rental->bukti_bayar) }}" alt="Bukti Pembayaran" class="img-fluid mb-3">
                                                <p><strong>Total:</strong> {{ number_format($rental->total, 0, ',', '.') }}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                                <a href="{{ url('selesaikanPesanan', ['id_rental' => $rental->id_rental]) }}" class="btn btn-success">Selesaikan Pesanan</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @else
                            <p class="text-center text-muted">Tidak ada mobil yang sedang dirental.</p>
                        @endif
                    </div>

                    <!-- Filter Tanggal untuk Mobil yang Baru Saja Dibeli -->
                    <h2 class="page-title mb-3">Mobil yang Baru Saja Dibeli</h2>
                    <form method="GET" action="{{ route('mobil.show', ['kategori' => 'jual']) }}" class="mb-4">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="start_date">Dari Tanggal:</label>
                                <input type="date" name="start_date" id="start_date" class="form-control" value="{{ request('start_date') }}">
                            </div>
                            <div class="col-md-4">
                                <label for="end_date">Hingga Tanggal:</label>
                                <input type="date" name="end_date" id="end_date" class="form-control" value="{{ request('end_date') }}">
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary">Filter</button>
                            </div>
                        </div>
                    </form>

                    <!-- Tampilan Data Mobil yang Baru Saja Dibeli dalam Tabel -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Nama</th>
                                    <th>Tanggal</th>
                                    <th>No. Telp</th>
                                    <th>No. KTP</th>
                                    <th>Bukti Pembayaran</th>
                                    <th>Total</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(count($mobilJual) > 0)
                                    @foreach($mobilJual as $jual)
                                        <tr>
                                            <td>{{ $jual->nama }}</td>
                                            <td>{{ $jual->tanggal }}</td>
                                            <td>{{ $jual->no_telp }}</td>
                                            <td>{{ $jual->no_ktp }}</td>
                                            <td>
                                                <img src="{{ asset('assets/bukti_pembayaran/' . $jual->bukti_bayar) }}" alt="Bukti Pembayaran" class="img-fluid" style="width: 100px;">
                                            </td>
                                            <td>{{ number_format($jual->total, 0, ',', '.') }}</td>
                                            <td>
                                                <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#detailModalJual{{ $jual->id_jual }}">Lihat Detail</button>
                                            </td>
                                        </tr>

                                        <!-- Modal Detail Jual -->
                                        <div class="modal fade" id="detailModalJual{{ $jual->id_jual }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabelJual" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="detailModalLabelJual">Detail Pembelian - {{ $jual->nama }}</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <!-- Detail content here -->
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7" class="text-center text-muted">Tidak ada data pembelian mobil untuk rentang tanggal yang dipilih.</td>
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
                @elseif($id_level == 2)
                    <!-- Tampilan untuk pelanggan -->
                    <div class="row my-4">
                        <div class="col-md-6">
                            <div class="card shadow bg-primary text-center mb-4">
                                <div class="card-body p-5">
                                    <span class="circle circle-md bg-primary-light">
                                        <i class="fe fe-navigation fe-24 text-white"></i>
                                    </span>
                                    <h3 class="h4 mt-4 mb-1 text-white">Sewa Mobil</h3>
                                    <p class="text-white mb-4">Temukan dan rental mobil pilihan Anda sekarang juga.</p>
                                    <a href="{{ route('mobil.show', ['kategori' => 'rental']) }}" class="btn btn-lg bg-primary-light text-white">
                                        Rental Mobil<i class="fe fe-arrow-right fe-16 ml-2"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card shadow bg-success text-center mb-4">
                                <div class="card-body p-5">
                                    <span class="circle circle-md bg-success-light">
                                        <i class="fe fe-shopping-cart fe-24 text-white"></i>
                                    </span>
                                    <h3 class="h4 mt-4 mb-1 text-white">Beli Mobil</h3>
                                    <p class="text-white mb-4">Dapatkan mobil impian Anda secara langsung di sini.</p>
                                    <a href="{{ route('mobil.show', ['kategori' => 'jual']) }}" class="btn btn-lg bg-success-light text-white">
                                        Beli Mobil<i class="fe fe-arrow-right fe-16 ml-2"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</main>
