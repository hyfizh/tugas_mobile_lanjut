import 'package:flutter/material.dart';
import 'proses.dart';
import 'package:intl/intl.dart';

class CustomerEntryScreen extends StatefulWidget {
  @override
  _CustomerEntryScreenState createState() => _CustomerEntryScreenState();
}

class _CustomerEntryScreenState extends State<CustomerEntryScreen> {
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jenisPelangganController = TextEditingController();
  final TextEditingController _jamMasukController = TextEditingController();
  final TextEditingController _jamKeluarController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _navigateToBilling(BuildContext context) {
    final String kode = _kodeController.text;
    final String nama = _namaController.text;
    final String jenisPelanggan = _jenisPelangganController.text;
    final double jamMasuk = double.parse(_jamMasukController.text);
    final double jamKeluar = double.parse(_jamKeluarController.text);

    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BillingProcessScreen(
          kode: kode,
          nama: nama,
          jenisPelanggan: jenisPelanggan,
          jamMasuk: jamMasuk,
          jamKeluar: jamKeluar,
          tanggal: formattedDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _kodeController,
              decoration: InputDecoration(labelText: 'Kode Pelanggan'),
            ),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            TextField(
              controller: _jenisPelangganController,
              decoration: InputDecoration(labelText: 'Jenis Pelanggan (VIP/GOLD)'),
            ),
            TextField(
              controller: _jamMasukController,
              decoration: InputDecoration(labelText: 'Jam Masuk'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _jamKeluarController,
              decoration: InputDecoration(labelText: 'Jam Keluar'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tanggal: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _pickDate(context),
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToBilling(context),
              child: Text('Proses Data'),
            ),
          ],
        ),
      ),
    );
  }
}
