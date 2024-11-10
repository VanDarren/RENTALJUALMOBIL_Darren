
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center mb-2">
                    <div class="col">
                        <div class="row">
                            <div class="col-md-12 my-4">
                                <h2 class="h4 mb-1">Restore Deleted Stok Mobil</h2>
                                <p class="mb-4">Daftar mobil yang dihapus dan dapat dipulihkan kembali.</p>
                                
                                <!-- Tombol Kembali -->
                                <a href="{{ url('stok') }}" class="btn btn-secondary mb-3">Kembali</a>

                                <div class="card shadow">
                                    <div class="card-body">
                                        <!-- table -->
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th>Nama Mobil</th>
                                                    <th>Merek</th>
                                                    <th>Jenis</th>
                                                    <th>Kategori</th>
                                                    <th>Deleted By</th>
                                                    <th>Deleted At</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="deletedMobilTable">
                                                @if(count($deletedMobil) > 0)
                                                    @foreach ($deletedMobil as $item)
                                                    <tr>
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
                                                        <td>{{ $item->deleted_by }}</td>
                                                        <td>{{ $item->deleted_at }}</td>
                                                        <td>
                                                            <form action="{{ url('actrestoredeletedstok/' . $item->id_mobil) }}" method="POST" style="display:inline;">
                                                                @csrf
                                                                <button type="submit" class="dropdown-item" onclick="return confirm('Are you sure you want to restore this item?');">Restore</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    @endforeach
                                                @else
                                                    <tr>
                                                        <td colspan="7" class="text-center">Tidak ada mobil yang dihapus.</td>
                                                    </tr>
                                                @endif
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
