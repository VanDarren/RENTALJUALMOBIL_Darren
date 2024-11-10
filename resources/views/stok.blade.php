<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center mb-2">
                <div class="col">
                <div class="row">
    <div class="col-md-12 my-4">
        <h2 class="h4 mb-1">Stok Mobil</h2>
        <p class="mb-4">Daftar stok mobil yang tersedia untuk rental dan penjualan.</p>
        <div class="card shadow">
            <div class="card-body">
                <div class="toolbar row mb-3">
                    <div class="col">
                    <form id="filterForm" class="form-inline">
    <div class="form-row">
        <!-- Input Search -->
        <div class="form-group col-auto">
            <label for="search" class="sr-only">Search</label>
            <input type="text" class="form-control" id="search" placeholder="Search">
        </div>

        <!-- Dropdown Filter Kategori -->
        <div class="form-group col-auto ml-3">
            <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref">Kategori</label>
            <select class="custom-select my-1 mr-sm-2" id="kategori">
                <option value="">Choose...</option>
                <option value="Rental">Rental</option>
                <option value="Jual">Jual</option>
            </select>
        </div>
    </div>
</form>
                    </div>
                    <div class="col ml-auto">
                        <div class="dropdown float-right">
                            <a class="btn btn-primary float-right ml-3" href="{{url('addstok')}}">Add +</a>
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button>
                            <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                                <a class="dropdown-item" href="{{ url('restoredeletedstok') }}">Restore Edit</a>
                                <a class="dropdown-item" href="{{ url('restoredeletedstok') }}">Restore Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- table -->
                <table class="table table-bordered">
    <thead>
        <tr role="row">
            <th>Nama Mobil</th>
            <th>Merek</th>
            <th>Jenis</th>
            <th>Kategori</th>
            <th>Stok</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="mobilTable">
        @foreach ($mobil as $item)
        <tr data-nama="{{ strtolower($item->nama_mobil) }}" data-kategori="{{ $item->kategori }}">
            <td class="font-weight-bold">{{ $item->nama_mobil }}</td>
            <td>{{ $item->merek }}</td>
            <td>{{ $item->jenis }}</td>
            <td>
                @if($item->kategori == 'Rental')
                    <span class="badge badge-primary badge-larger">Rental</span>
                @else
                    <span class="badge badge-danger badge-larger">Jual</span>
                @endif
            </td>
            <td>{{ $item->stok }}</td>
            <td>
                <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="text-muted sr-only">Action</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="{{ url('editstok/' . $item->id_mobil) }}">Edit</a>
                    <form action="{{ url('deletestok/' . $item->id_mobil) }}" method="POST" style="display:inline;">
    @csrf
    @method('DELETE')
    <button type="submit" class="dropdown-item" onclick="return confirm('Are you sure you want to delete this item?');">Remove</button>
</form>

                </div>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
            </div>
        </div>
    </div>
</div>
                </div>
                
              </div>

            </div>
          </div>
        </div>
      </main> 

<style>
    .badge-larger {
        font-size: 0.9em;
        padding: 0.45em 0.65em;
    }
    
</style>

<script>
    // Ambil elemen input search dan select kategori
let searchInput = document.getElementById('search');
let categorySelect = document.getElementById('kategori');

// Fungsi untuk melakukan filter tabel
function filterTable() {
    let searchValue = searchInput.value.toLowerCase();  // Ambil nilai pencarian
    let selectedCategory = categorySelect.value;  // Ambil nilai kategori yang dipilih

    // Ambil semua baris dari tabel mobil
    let rows = document.querySelectorAll('#mobilTable tr');

    rows.forEach(function(row) {
        let namaMobil = row.getAttribute('data-nama');  // Ambil nama mobil dari data-nama
        let kategoriMobil = row.getAttribute('data-kategori');  // Ambil kategori mobil dari data-kategori

        // Cek apakah baris cocok dengan pencarian dan filter kategori
        let matchNama = namaMobil.includes(searchValue);  // Cek jika nama mobil cocok dengan pencarian
        let matchKategori = selectedCategory === '' || kategoriMobil === selectedCategory;  // Cek jika kategori cocok atau kosong

        // Jika cocok, tampilkan baris, jika tidak sembunyikan
        if (matchNama && matchKategori) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Event listener untuk input pencarian dan dropdown kategori
searchInput.addEventListener('input', filterTable);  // Aktifkan filter saat mengetik di search
categorySelect.addEventListener('change', filterTable);  // Aktifkan filter saat memilih kategori

</script>