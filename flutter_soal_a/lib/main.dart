import 'package:flutter/material.dart';

void main() {
  runApp(WarnetApp());
}

class WarnetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billing Warnet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Input Data Pelanggan'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PelangganPage()));
              },
            ),
            ListTile(
              title: Text('Input Transaksi Warnet'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TransaksiPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Selamat Datang di Aplikasi Billing Warnet!'),
      ),
    );
  }
}

// Class Pelanggan
class Pelanggan {
  final String kode;
  final String nama;

  Pelanggan(this.kode, this.nama);
}

// Halaman Input Data Pelanggan
class PelangganPage extends StatefulWidget {
  @override
  _PelangganPageState createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Data Pelanggan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: kodeController,
              decoration: InputDecoration(labelText: 'Kode Pelanggan'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Pelanggan pelanggan = Pelanggan(
                    kodeController.text, namaController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data Pelanggan Tersimpan')),
                );
              },
              child: Text('Simpan Data Pelanggan'),
            ),
          ],
        ),
      ),
    );
  }
}

// Class Warnet
class Warnet {
  final String kodeTransaksi;
  final String namaPelanggan;
  final String jenisPelanggan;
  final String tglMasuk;
  final int jamMasuk;
  final int jamKeluar;
  final double tarif;
  double diskon = 0.0;

  Warnet(
    this.kodeTransaksi,
    this.namaPelanggan,
    this.jenisPelanggan,
    this.tglMasuk,
    this.jamMasuk,
    this.jamKeluar,
    this.tarif,
  );

  double hitungTotalBayar() {
    int lama = jamKeluar - jamMasuk;
    double totalTarif = lama * tarif;

    if (jenisPelanggan == 'VIP' && lama > 2) {
      diskon = 0.02 * totalTarif;
    } else if (jenisPelanggan == 'GOLD' && lama > 2) {
      diskon = 0.05 * totalTarif;
    }

    return totalTarif - diskon;
  }
}

// Halaman Input Transaksi Warnet
class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  TextEditingController kodeTransaksiController = TextEditingController();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController tglMasukController = TextEditingController();
  TextEditingController jamMasukController = TextEditingController();
  TextEditingController jamKeluarController = TextEditingController();
  String jenisPelanggan = 'Regular';
  double tarif = 10000.0;
  double totalBayar = 0.0;

  void hitungTotal() {
    int jamMasuk = int.tryParse(jamMasukController.text) ?? 0;
    int jamKeluar = int.tryParse(jamKeluarController.text) ?? 0;

    Warnet transaksi = Warnet(
      kodeTransaksiController.text,
      namaPelangganController.text,
      jenisPelanggan,
      tglMasukController.text,
      jamMasuk,
      jamKeluar,
      tarif,
    );

    setState(() {
      totalBayar = transaksi.hitungTotalBayar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Transaksi Warnet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: kodeTransaksiController,
              decoration: InputDecoration(labelText: 'Kode Transaksi'),
            ),
            TextField(
              controller: namaPelangganController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            DropdownButton<String>(
              value: jenisPelanggan,
              onChanged: (String? newValue) {
                setState(() {
                  jenisPelanggan = newValue!;
                });
              },
              items: <String>['Regular', 'VIP', 'GOLD']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: tglMasukController,
              decoration: InputDecoration(labelText: 'Tanggal Masuk'),
            ),
            TextField(
              controller: jamMasukController,
              decoration: InputDecoration(labelText: 'Jam Masuk (24 jam)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: jamKeluarController,
              decoration: InputDecoration(labelText: 'Jam Keluar (24 jam)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungTotal,
              child: Text('Hitung Total Bayar'),
            ),
            SizedBox(height: 20),
            Text(
              'Total Bayar: Rp $totalBayar',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
