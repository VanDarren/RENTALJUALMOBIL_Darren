<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center mb-2">
                    <div class="col">
                        <h2 class="h5 page-title">Deskripsi Mobil</h2>
                    </div>
                </div>
                <div class="card shadow my-4">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="mx-4">
                                    <img src="{{ asset('assets/mobil/' . $mobil->foto) }}" alt="{{ $mobil->nama_mobil }}" class="img-fluid rounded">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mx-4">
                                    <h3>{{ $mobil->nama_mobil }}</h3>
                                    <div class="row mt-4">
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Merek</p>
                                            <span class="h6 mb-0">{{ $mobil->merek }}</span>
                                        </div>
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Jenis</p>
                                            <span class="h6 mb-0">{{ $mobil->jenis }}</span>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Tahun</p>
                                            <span class="h6 mb-0">{{ $mobil->tahun }}</span>
                                        </div>
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Tipe</p>
                                            <span class="h6 mb-0">{{ $mobil->tipe }}</span>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Kategori</p>
                                            <span class="h6 mb-0">{{ $mobil->kategori }}</span>
                                        </div>
                                        <div class="col-6">
                                            <p class="small text-uppercase text-muted mb-0">Stok</p>
                                            <span class="h6 mb-0">{{ $mobil->stok }} unit</span>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        @if($mobil->kategori == 'Rental')
                                            <p class="small text-uppercase text-muted mb-0">Harga Rental</p>
                                            <span class="h4 mb-0">Rp {{ number_format($mobil->harga_rental, 0, ',', '.') }}/hari</span>
                                        @elseif($mobil->kategori == 'Jual')
                                            <p class="small text-uppercase text-muted mb-0">Harga Jual</p>
                                            <span class="h4 mb-0">Rp {{ number_format($mobil->harga_jual, 0, ',', '.') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="mx-4">
                                    <h5 class="text-uppercase text-muted">Deskripsi</h5>
                                    <p class="text-muted">{{ $mobil->deskripsi }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>