<main role="main" class="main-content">
    <!-- Wizard Navigation -->
    <ul class="nav nav-pills justify-content-center mb-4">
        <li class="nav-item">
            <a class="nav-link active" id="step1-tab" onclick="showStep(1)">Konfirmasi Pesanan</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="step2-tab" onclick="showStep(2)">Data Diri</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="step3-tab" onclick="showStep(3)">Bukti Pembayaran</a>
        </li>
    </ul>

    <!-- Page 1: Konfirmasi Pesanan -->
    <div id="step1" class="wizard-step">
        @if ($kategori === 'Rental')
            <h4 class="text-center mb-3">Kode Cart: {{ $kode_cart }}</h4>
            <table class="table text-center">
                <thead>
                    <tr>
                        <th>Nama Mobil</th>
                        <th>Harga Rental</th>
                        <th>Jumlah Hari</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cartItems as $item)
                    <tr>
                        <td>{{ $item->nama_mobil }}</td>
                        <td>Rp {{ number_format($item->harga, 0, ',', '.') }}</td>
                        <td>{{ $item->hari }} Hari</td>
                        <td>Rp {{ number_format($item->total, 0, ',', '.') }}</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">Total Pembayaran</th>
                        <th>Rp {{ number_format($total, 0, ',', '.') }}</th>
                    </tr>
                </tfoot>
            </table>
        @else
            <h4 class="text-center mb-3">Pembelian Mobil: {{ $mobil->nama_mobil }}</h4>
            <p class="text-center">Harga: Rp {{ number_format($mobil->harga_jual, 0, ',', '.') }}</p>
            <div class="text-center mt-4">
    <img src="{{ asset('assets/mobil/' . $mobil->foto) }}" class="card-img-top" alt="{{ $mobil->nama_mobil }}" style="max-width: 800px; height: auto;">
</div>

        @endif
        <div class="text-center mt-4">
            <button class="btn btn-primary" onclick="showStep(2)">Lanjut ke Data Diri</button>
        </div>
    </div>

   <!-- Page 2: Data Diri (Untuk Rental dan Jual) -->
<div id="step2" class="wizard-step" style="display: none;">
    <h4 class="text-center mb-4">Isi Data Diri</h4>
    <form action="{{ $kategori === 'Rental' ? url('/konfirmasi-pembayaran') : url('/konfirmasi-pembayaran-jual/' . $mobil->id_mobil) }}" method="POST" enctype="multipart/form-data" class="text-center">
        @csrf
        @if ($kategori === 'Rental')
            <input type="hidden" name="kode_cart" value="{{ $kode_cart }}">
        @endif

        <div class="form-group row justify-content-center">
            <label for="nama_lengkap" class="col-sm-3 col-form-label">Nama Lengkap:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="nama_lengkap" name="nama_lengkap" required>
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <label for="no_telpon" class="col-sm-3 col-form-label">No. Telepon:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="no_telpon" name="no_telpon" required>
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <label for="no_ktp" class="col-sm-3 col-form-label">Nomor KTP:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="no_ktp" name="no_ktp" required>
            </div>
        </div>

        <div class="text-center mt-4">
            <button type="button" class="btn btn-primary" onclick="showStep(3)">Lanjut ke Bukti Pembayaran</button>
        </div>
        <div class="text-center mt-1">
            <button type="button" class="btn btn-secondary mt-3" onclick="showStep(1)">Kembali ke Konfirmasi Pesanan</button>
        </div>
 
        </div>

<!-- Page 3: Bukti Pembayaran -->
<div id="step3" class="wizard-step" style="display: none;">
    <h4 class="text-center mb-4">Unggah Bukti Pembayaran</h4>
    <div class="row justify-content-center mb-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Informasi Pembayaran</h5>
                    <p class="card-text">
                        Silakan transfer ke rekening berikut:<br>
                        <strong>Bank ABC</strong><br>
                        No. Rekening: 1234567890<br>
                        Atas Nama: Van Darren
                    </p>
                </div>
            </div>
        </div>
    </div>

   
        @if ($kategori === 'Rental')
            <input type="hidden" name="kode_cart" value="{{ $kode_cart }}">
        @endif

        <div class="form-group row justify-content-center">
            <label for="bukti_pembayaran" class="col-sm-3 col-form-label">Pilih Bukti Pembayaran:</label>
            <div class="col-sm-6">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="bukti_pembayaran" name="bukti_pembayaran" accept="image/*" required onchange="previewImage(event)">
                    <label class="custom-file-label" for="bukti_pembayaran">Choose file</label>
                </div>
            </div>
        </div>

        <!-- Image preview -->
        <div class="text-center mt-4">
            <img id="imagePreview" src="#" alt="Preview Gambar" style="display: none; max-width: 100%; height: auto;"/>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">Konfirmasi Pembayaran</button>
        </div>
        <div class="text-center mt-1">
            <button type="button" class="btn btn-secondary mt-3" onclick="showStep(2)">Kembali</button>
        </div>
    </form>
</div>

</main>

<script>
    function showStep(step) {
        document.querySelectorAll('.wizard-step').forEach((element, index) => {
            element.style.display = (index + 1) === step ? 'block' : 'none';
        });
        document.querySelectorAll('.nav-link').forEach((link, index) => {
            link.classList.toggle('active', (index + 1) === step);
        });
    }

    function previewImage(event) {
        const image = document.getElementById('imagePreview');
        image.src = URL.createObjectURL(event.target.files[0]);
        image.style.display = 'block';
    }
</script>
