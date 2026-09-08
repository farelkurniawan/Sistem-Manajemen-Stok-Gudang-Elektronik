import 'dart:io';
import 'datakelompok.dart';

void tampilkanMenu() {
  while (true) {
    print("\n==============================");
    print("          MENU UTAMA");
    print("==============================");
    print("1. Data Kelompok");
    print("2. menu penjumlahan");
    print("3.menu input bilangan");
    print("0. Keluar");
    print("==============================");

    stdout.write("Pilih menu : ");
    String? pilihan = stdin.readLineSync();

    if (pilihan == "1") {
      dataKelompok();
    } else if (pilihan == "0") {
      print("\nProgram selesai.");
      break;
    } else {
      print("\nPilihan tidak tersedia!");
    }
  }
}