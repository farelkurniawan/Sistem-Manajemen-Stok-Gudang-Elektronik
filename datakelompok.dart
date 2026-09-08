import 'dart:io';

void dataKelompok() {
  print("\n==============================");
  print("        DATA KELOMPOK");
  print("==============================");

  print("Nama Kelompok : Kelompok 1");
  print("Mata Kuliah   : Pemrograman Dart");

  print("\nAnggota Kelompok:");
  print("1. Mas Anies - 124240163");
  print("2. Azizah Mualifah - 124240165");
  print("3. Agnaita Naswa Fadilla - 124240166");
  print("4. Naila Faiza Ramadani - 1242401777");

  print("\n==============================");
  print("0. Kembali ke menu utama");
  print("==============================");

  stdout.write("Pilih : ");
  String? pilihan = stdin.readLineSync();

  if (pilihan == "0") {
    return;
  }
}