print('\n==========BARANG MASUK/KELUAR=========');
const String namaFile = 'data_barang.txt';

class Barang{
    String nama;
    int stok;
    int harga;
    int nomorSeri;

    Barang({required this.nama, required this.stok, required this.harga, required this.nomorSeri});

    String toLine() => '$nomorSeri, $nama', '$stok', '$harga';

    static Barang fromLine(String line) {
        List<String> bagian = line.split(',');
        return Barang(
            nomorSeri: int.parse(bagian[0]),
            nama: bagian[1];
            stok: int.parse(bagian[2]);
            harga: int.parse(bagian[3]),
        );
    }
}

List<Barang> bacaDataBarang(){
    File file = File(namaFile);
    List<Barang> daftar = [];
 
  if (!file.existsSync()) return daftar;
 
  List<String> baris = file.readAsLinesSync();
  for (var line in baris) {
    if (line.trim().isEmpty) continue;
    daftar.add(Barang.fromLine(line));
  }
  return daftar;
}
 
void simpanDataBarang(List<Barang> daftar) {
  File file = File(namaFile);
  StringBuffer buffer = StringBuffer();
  for (var b in daftar) {
    buffer.writeln(b.toLine());
  }
  file.writeAsStringSync(buffer.toString());
}
 
int generateKodeBaru(List<Barang> daftar) {
  if (daftar.isEmpty) return 1;
  int kodeMax = daftar.map((b) => b.kode).reduce((a, b) => a > b ? a : b);
  return kodeMax + 1;
}
 
void menuBarangMasukKeluar() {
  print('\n=== BARANG MASUK / KELUAR ===');
  List<Barang> daftar = bacaDataBarang();
 
  if (daftar.isNotEmpty) {
    print('Barang yang sudah ada:');
    for (int i = 0; i < daftar.length; i++) {
      print('${i + 1}. ${daftar[i].nama} (stok: ${daftar[i].stok})');
    }
  } else {
    print('Belum ada barang tersimpan.');
  }
 
  stdout.write('\nNama barang (baru atau yang sudah ada): ');
  String nama = stdin.readLineSync()?.trim() ?? '';
 
  if (nama.isEmpty) {
    print('Nama barang tidak boleh kosong.\n');
    return;
  }
 
  // Cari apakah barang sudah ada (case-insensitive)
  int index = daftar.indexWhere((b) => b.nama.toLowerCase() == nama.toLowerCase());
 
  stdout.write('1. Barang Masuk (Tambah)\n2. Barang Keluar (Kurang)\nPilih: ');
  String pilihan = stdin.readLineSync()?.trim() ?? '';
 
  stdout.write('Jumlah: ');
  int jumlah = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
 
  if (index == -1) {
    // Barang baru -> hanya boleh untuk barang masuk, wajib input harga
    if (pilihan != '1') {
      print('Barang belum terdaftar, tidak bisa dikurangi. Lakukan barang masuk terlebih dahulu.\n');
      return;
    }
    stdout.write('Harga satuan barang baru: ');
    int harga = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
 
    Barang baru = Barang(
      nama: nama,
      stok: jumlah,
      harga: harga,
      kode: generateKodeBaru(daftar),
    );
    daftar.add(baru);
    simpanDataBarang(daftar);
    print('\nBarang baru "$nama" berhasil ditambahkan dengan kode ${baru.kode}.');
    print('Stok awal: ${baru.stok}\n');
  } else {
    Barang b = daftar[index];
    if (pilihan == '1') {
      b.stok += jumlah;
      print('\nBarang masuk berhasil dicatat.');
    } else if (pilihan == '2') {
      if (jumlah > b.stok) {
        print('\nStok tidak cukup! Stok tersedia: ${b.stok}\n');
        return;
      }
      b.stok -= jumlah;
      print('\nBarang keluar berhasil dicatat.');
    } else {
      print('\nPilihan tidak valid.\n');
      return;
    }
    simpanDataBarang(daftar);
    print('Stok "${b.nama}" sekarang: ${b.stok}\n');
  }
}
 
void main() {
  File file = File(namaFile);
  if (!file.existsSync()) {
    file.createSync();
  }
 
  bool ulangi = true;
  while (ulangi) {
    menuBarangMasukKeluar();
    stdout.write('Input barang lagi? (y/n): ');
    String jawab = stdin.readLineSync()?.trim().toLowerCase() ?? 'n';
    ulangi = jawab == 'y';
  }
}