<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Keuangan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        h3 {
            text-align: center;
        }
    </style>
</head>
<body>
<h3>Laporan Keuangan untuk Kategori: {{ $kategori }}</h3>

    @if($kategori == 'Rental')
        <h4>Daftar Transaksi Rental</h4>
    @else
        <h4>Daftar Transaksi Jual</h4>
    @endif
    <table>
        <thead>
            <tr>
                <th>Nama Mobil</th>
                <th>Tanggal</th>
                <th>Status</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($transaksi as $item)
                <tr>
                    <td>{{ $item->nama_mobil }}</td>
                    <td>{{ $item->tanggal }}</td>
                    <td>{{ $item->status ?? 'N/A' }}</td>
                    <td>Rp {{ number_format($item->total, 0, ',', '.') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
