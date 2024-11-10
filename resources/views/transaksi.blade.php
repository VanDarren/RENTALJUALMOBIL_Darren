<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="h4 mb-1">Riwayat Transaksi</h2>
                <p class="mb-4">Berikut adalah daftar transaksi rental dan penjualan mobil.</p>
                
                <form action="{{ route('laporan.generate') }}" method="GET">
    <div class="form-group">
        <label for="kategori">Kategori</label>
        <select class="form-control" id="kategori" name="kategori">
            <option value="Rental" @if(request()->kategori == 'Rental') selected @endif>Rental</option>
            <option value="Jual" @if(request()->kategori == 'Jual') selected @endif>Jual</option>
        </select>
    </div>

    <div class="form-group">
        <label for="start_date">Tanggal Mulai</label>
        <input type="date" class="form-control" id="start_date" name="start_date" value="{{ request()->start_date }}">
    </div>

    <div class="form-group">
        <label for="end_date">Tanggal Selesai</label>
        <input type="date" class="form-control" id="end_date" name="end_date" value="{{ request()->end_date }}">
    </div>

    <button type="submit" class="btn btn-primary">Generate Laporan</button>
</form>


                <div class="card shadow">
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="transactionTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link @if($kategori == 'Rental') active @endif" id="rental-tab" href="{{ route('transaksi.rental') }}">Rental</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link @if($kategori == 'Jual') active @endif" id="jual-tab" href="{{ route('transaksi.jual') }}">Jual</a>
                            </li>
                        </ul>
                        <div class="tab-content mt-3" id="transactionTabContent">
                            <!-- Rental Tab -->
                            @if($kategori == 'Rental')
                                <div class="tab-pane fade show active" id="rental" role="tabpanel" aria-labelledby="rental-tab">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nama Mobil</th>
                                                <th>Durasi (hari)</th>
                                                <th>Tanggal</th>
                                                <th>Status</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($transaksi as $item)
                                                <tr>
                                                    <td>{{ $item->nama_mobil }}</td>
                                                    <td>{{ $item->jumlah_hari }}</td>
                                                    <td>{{ $item->tanggal }}</td>
                                                    <td>{{ $item->status }}</td>
                                                    <td>Rp {{ number_format($item->total, 0, ',', '.') }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @endif
                            
                            <!-- Jual Tab -->
                            @if($kategori == 'Jual')
                                <div class="tab-pane fade show active" id="jual" role="tabpanel" aria-labelledby="jual-tab">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nama Mobil</th>
                                                <th>Tanggal</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($transaksi as $item)
                                                <tr>
                                                    <td>{{ $item->nama_mobil }}</td>
                                                    <td>{{ $item->tanggal }}</td>
                                                    <td>Rp {{ number_format($item->total, 0, ',', '.') }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
