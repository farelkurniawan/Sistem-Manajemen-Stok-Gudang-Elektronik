import 'dart:io';
import 'datakelompok.dart';

void tampilkanMenu() {
  while (true) {
    print("\n==============================");
    print("          MENU UTAMA");
    print("==============================");
    print("1. Data Kelompok");
    print("2. Input Barang Masuk/ Keluar");
    print("3. Apaa ini");
    print("0. Keluar");
    print("==============================");

    stdout.write("Pilih menu : ");
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case "1":
        dataKelompok();
        break;
      case "2":
        inputbarang();
        break;
        
      case "0":
        print("Program selesai.");
        return;

      default:
        print("Pilihan tidak tersedia.");
    }
  }
}
