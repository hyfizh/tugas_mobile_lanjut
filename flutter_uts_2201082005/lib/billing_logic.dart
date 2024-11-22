class BillingLogic {
  static double hitungTotal(String jenisPelanggan, String jamMasukStr, String jamKeluarStr) {
    int jamMasuk = int.tryParse(jamMasukStr) ?? 0;
    int jamKeluar = int.tryParse(jamKeluarStr) ?? 0;
    int lama = jamKeluar - jamMasuk;
    double tarifPerJam = 10000;
    double diskon = 0.0;

    if (lama > 0) {
      double totalTarif = lama * tarifPerJam;

      if (jenisPelanggan == "VIP" && lama > 2) {
        diskon = 0.02 * totalTarif;
      } else if (jenisPelanggan == "GOLD" && lama > 2) {
        diskon = 0.05 * totalTarif;
      } else {
        diskon = 0.0;
      }

      return totalTarif - diskon;
    } else {
      return 0.0;
    }
  }
}
