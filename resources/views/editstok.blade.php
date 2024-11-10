<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="page-title">Edit Stok Mobil</h2>
                <p class="text-muted">Formulir untuk mengedit data stok mobil.</p>
                <div class="card shadow mb-4">
                    <div class="card-header">
                        <strong class="card-title">Form Edit Mobil</strong>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('updatestok/' . $mobil->id_mobil) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nama_mobil">Nama Mobil</label>
                                    <input type="text" class="form-control" id="nama_mobil" name="namamobil" value="{{ $mobil->nama_mobil }}" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="merek">Merek</label>
                                    <input type="text" class="form-control" id="merek" name="merek" value="{{ $mobil->merek }}" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="jenis">Jenis</label>
                                    <select id="jenis" name="jenis" class="form-control" required>
                                        <option value="" disabled>Pilih Jenis...</option>
                                        @foreach($jenis_mobil as $jenis)
                                            <option value="{{ $jenis }}" {{ $mobil->jenis == $jenis ? 'selected' : '' }}>{{ $jenis }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="kategori">Kategori</label>
                                    <select id="kategori" name="kategori" class="form-control" required onchange="toggleHarga()">
                                        <option value="" disabled>Pilih Kategori...</option>
                                        <option value="Rental" {{ $mobil->kategori == 'Rental' ? 'selected' : '' }}>Rental</option>
                                        <option value="Jual" {{ $mobil->kategori == 'Jual' ? 'selected' : '' }}>Jual</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Harga Rental -->
                            <div class="form-group" id="harga_rental" >
                                <label for="harga_rental">Harga Rental (per hari)</label>
                                <input type="number" class="form-control" id="harga_rental_input" name="harga_rental" value="{{ $mobil->harga_rental }}">
                            </div>

                            <!-- Harga Jual -->
                            <div class="form-group" id="harga_jual">
                                <label for="harga_jual">Harga Jual</label>
                                <input type="number" class="form-control" id="harga_jual_input" name="harga_jual" value="{{ $mobil->harga_jual }}">
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="stok">Stok</label>
                                    <input type="number" class="form-control" id="stok" name="stok" value="{{ $mobil->stok }}" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tahun">Tahun</label>
                                    <input type="number" class="form-control" id="tahun" name="tahun" value="{{ $mobil->tahun }}" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="tipe">Tipe</label>
                                <input type="text" class="form-control" id="tipe" name="tipe" value="{{ $mobil->tipe }}" required>
                            </div>

                            <div class="form-group">
                                <label for="deskripsi">Deskripsi</label>
                                <textarea class="form-control" id="deskripsi" name="deskripsi" rows="3">{{ $mobil->deskripsi }}</textarea>
                            </div>

                            <!-- Custom input file for foto -->
                            <div class="form-group row">
                                <label for="foto" class="col-sm-2 col-form-label">Foto Mobil (biarkan kosong jika tidak diubah)</label>
                                <div class="col-sm-10">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="foto" name="foto">
                                        <label class="custom-file-label" for="foto">Pilih file</label>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Update Mobil</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- JavaScript untuk menampilkan kolom harga sesuai kategori -->
<script>
    function toggleHarga() {
        var kategori = document.getElementById('kategori').value;
        var hargaRental = document.getElementById('harga_rental');
        var hargaJual = document.getElementById('harga_jual');
        
        if (kategori === 'Rental') {
            hargaRental.style.display = 'block';
            hargaJual.style.display = 'none';
        } else if (kategori === 'Jual') {
            hargaRental.style.display = 'none';
            hargaJual.style.display = 'block';
        } else {
            hargaRental.style.display = 'none';
            hargaJual.style.display = 'none';
        }
    }

    // Agar label input file berubah ketika file dipilih
    document.querySelector('.custom-file-input').addEventListener('change', function(e) {
        var fileName = document.getElementById("foto").files[0].name;
        var nextSibling = e.target.nextElementSibling;
        nextSibling.innerText = fileName;
    });

    // Panggil toggleHarga saat halaman dimuat untuk menampilkan field yang sesuai
    document.addEventListener('DOMContentLoaded', function() {
        toggleHarga();
    });
</script>
