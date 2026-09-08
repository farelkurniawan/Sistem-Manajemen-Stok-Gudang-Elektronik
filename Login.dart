
import 'dart:io';
import 'menu.dart';

void main() {
  String username = "admin";
  String password = "adminkeren";

  print("LOGIN APLIKASI");

  for (int percobaan = 1; percobaan <= 3; percobaan++) {
    print("Masukan Username dan Password Anda");

    stdout.write("Username : ");
    String? inputUsername = stdin.readLineSync();

    stdout.write("Password : ");
    String? inputPassword = stdin.readLineSync();

    if (inputUsername == username && inputPassword == password) {
      print("\nLogin berhasil!");

      // Masuk ke menu utama
      tampilkanMenu();

      // Menghentikan perulangan karena login berhasil
      break;
    } else {
      print("\nLogin gagal username atau password salah.");

      // Jika sudah 3 kali gagal
      if (percobaan == 3) {
        print("Anda telah gagal login sebanyak 3 kali.");
      } else {
        print("Silakan coba lagi.");
      }
    }
  }
}
