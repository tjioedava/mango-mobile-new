# Tugas 9

1. Mengapa untuk melakukan penerimaan data dari server, harus melalui perantaraan model?

    Sebenarnya, pembuatan model sebagai perantaraan untuk mengonversi data model yang diterima dari server dalam bentuk JSON tidak wajib dan tanpa itu, kode tidak akan mengalami error, asalkan terdapat penyesuaian. Namun, pembuatan model adalah best practice karena dapat meningkatkan organisasi kode, dengan mengenkapsulasi model dalam bentuk JSON yang diterima dalam bentuk class Dart, sehingga pembacaan informasi dari model yang diterima dapat lebih mudah.

2. Fungsi dari library `http` dalam tugas ini

    Library `http` dalam tugas ini berfungsi supaya program dapat meminta request hypertext ke internet, yang dalam hal ini adalah domain dari 
    server Django kita.

3. Mekanisme pengiriman data input hingga disimpan diserver dan diterima kembali untuk ditampilkan.

    Pengiriman data input dilakukan dengan menyusun input-input dalam bentuk JSON, dan encode JSON tersebut dalam bentuk string yang dimasukkan ke POST request body untuk disimpan di server. Saat data ingin diambil kembali untuk ditampilkan di aplikasi, aplikasi memberi request GET untuk meminta data tersebut dalam bentuk JSON, yang kemudian di decode dan dikonversikan dalam bentuk instance model class kemudian dibaca.

4. Mekanisme proses autentikasi

    Pertama, cookies yang disediakan `Provider` tidak memiliki session ID yang terasosiasi dengannya. Namun, saat pada login page, yang adalah halaman pertama, user dapat mengetik kredensial suatu user dan membuat request login ke server, yang membuat instance `CookieRequest` memiliki session ID yang merujuk pada session yang baru dibuat oleh server. Setelah itu, user akan masuk ke home page. Di home page, user dapat mengklik tombol logout yang akan memberikan request ke server untuk menghapus session serta menghilangkan session ID dari instance `CookieRequest`. Jika user tidak memiliki akun, user dapat meminta request ke server untuk membuat akun, dengan request POST yang berisikan informasi kredensial akun yang ingin dibuat.

5. Tidak sempat hehe.