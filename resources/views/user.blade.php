<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center mb-2">
                <div class="col">
                <div class="row">
    <div class="col-md-12 my-4">
        <h2 class="h4 mb-1">User Data</h2>
        <p class="mb-4">Daftar data user.</p>
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
            <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref">Level</label>
            <select class="custom-select my-1 mr-sm-2" id="kategori">
                <option value="">Choose...</option>
                <option value="Admin">Admin</option>
                <option value="Pelanggan">Admin</option>
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
            <th>Username</th>
            <th>Level</th>
        </tr>
    </thead>
    <tbody id="mobilTable">
        @foreach ($mobil as $item)
        <tr data-nama="{{ strtolower($item->username) }}" data-kategori="{{ $item->username }}">
            <td class="font-weight-bold">{{ $item->username }}</td>
            <td>{{ $item->level }}</td>
            <td>
                <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="text-muted sr-only">Action</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="{{ url('editstok/' . $item->id_user) }}">Edit</a>
                    <form action="{{ url('deletestok/' . $item->id_user) }}" method="POST" style="display:inline;">
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

