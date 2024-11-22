import 'package:flutter/material.dart';
import 'billing_logic.dart';

class BillingPage extends StatefulWidget {
  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController jamMasukController = TextEditingController();
  TextEditingController jamKeluarController = TextEditingController();
  String jenisPelanggan = "Regular";
  double totalBayar = 0.0;

  void hitungTotal() {
    setState(() {
      totalBayar = BillingLogic.hitungTotal(
        jenisPelanggan,
        jamMasukController.text,
        jamKeluarController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Warnet'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Input Data Pelanggan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: kodeController,
                    decoration: InputDecoration(labelText: 'Kode Pelanggan'),
                  ),
                  TextField(
                    controller: namaController,
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
                    controller: jamMasukController,
                    decoration:
                        InputDecoration(labelText: 'Jam Masuk (24 jam)'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: jamKeluarController,
                    decoration:
                        InputDecoration(labelText: 'Jam Keluar (24 jam)'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: hitungTotal,
                    child: Text('Hitung Total Bayar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Output Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Output Perhitungan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Bayar: Rp $totalBayar',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
