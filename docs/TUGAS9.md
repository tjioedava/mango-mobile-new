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

5. Penjelasan pengerjaan tutorial 

    1) Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter

        Buat stateful widget yang merepresentasikan halaman registrasi dengan state berupa kontroller terhadap input kredensial yang ingin dibuat pengguna. Kemudian, dalam class state dari widget tersebut, buat field input username, password, dan konfirmasi password yang terasosiasi dengan kontroller masing-masing. Setiap kali terdapat perubahan dalam field, state kontroller akan berubah dan rebuild (mungkin) terjadi. Terakhir, letakkan button di tempat paling bawah yang jika ditekan, akan trigger validasi setiap input field dan nilai dari state kontroller akan diperoleh untuk dikirim ke server. 

        Di sisi server, dibuat view dan URl yang menerima input kredensial yang akan dibuat, lalu input tersebut digunakan untuk membuat objek `User` baru.

    2) Membuat halaman login pada proyek tugas Flutter.

        Prosesnya hampir sama dengan tahap pertama saat membuat halaman registrasi, hanya saja input field dibuat untuk menampung kredensial user yang sudah ada. Fungsi callback button dari halaman ini juga akan melakukan login request ke server menggunakan fungsi dari package `pbp_django_auth`, yang 'menempelkan' session ID ke cookies yang disediakan oleh `Provider`.
        
        Di sisi server, view diimplementasikan dengan menerima input kredensial dan mencari user dengan kredensial yang sesuai, lalu melakukan login terhadap user tersebut untuk menciptakan session dan session ID untuk user tersebut.

        Kemudian, dibuat navigasi ke halaman registrasi, yang diimplementasikan secara mudah dengan membuat button yang jika ditekan, akan push halaman registrasi oleh `Navigator`. Di halaman registrasi, dibuat button yang akan pop halaman tersebut sehingga kembali lagi ke halaman login.

    3) Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

        Hal ini sudah cukup dijelaskan di tahap pertama dan kedua. Untuk penjelasan lebih lanjut, button yang terdapat di form bagian bawah diberikan callback action yang akan melakukan request ke server untuk mendaftarkan pengguna baru ataupun log in seorang pengguna dengan data kredensial yang dipost melalui JSON ataupun struktur data lainnya sesuai dengan implementasi method di `pbp_django_auth`.
    
    4) Membuat model kustom sesuai dengan proyek aplikasi Django.

        Hal ini dilakukan dengan membuat class yang merepresentasikan `Product`, dengan factory yang berguna untuk membuat instance baru berdasarkan input representasi produk dalam format JSON. Didefinisikan juga method yang melakukan encode instance `Product` ke dalam bentuk JSON. Hal ini dilakukan untuk mempermudah komunikasi dengan server, sehingga data produk yang diperoleh dari server dapat secara mudah ditranslasikan ke dalam bentuk instance class `Product` melalui factory tersebut, vica versa. 

    5) Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

        Hal ini dilakukan dengan membuat halaman yang konten utamanya dalam bentuk `FutureBuilder`, di mana widget tersebut akan secara definitif di-build saat suatu `Future` sudah diselesaikan. `Future` yang dimaksud adalah hasil fetch asinkronus produk-produk melalui request GET yang kemudian dikonversikan melalui factory yang dijelaskan di tahap ke-4. Saat `Future` tersebut sudah di-resolve, di mana produk-produk sudah terdefinisi, akan dibuat penyusunan widget yang mendisplay setiap produk tersebut secara list menggunakan `ListView.builder`.

        Sisi server telah diimplementasi sebelum proyek Flutter ini dibuat, di mana terdapat view yang mendeliver semua produk yang terasosiasikan dengan pengguna yang melakukan request.

    6) Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

        Setiap widget yang mendisplay keterangan produk diwrap oleh `InkWell`, yang membuat widget tersebut dapat ditekan. Kemudian, callback function untuk follow-up penekanan widget tersebut dibuat untuk melakukan push halaman yang secara khusus mendisplay keterangan produk yang terasosiasi. Halaman tersebut diimplementasi dengan cara membuat instance dari `Product` sebagai parameter dari widget tersebut, sehingga widget tersebut dapat menampilkan atribut dari instance `Product` dalam kontennya. 
        
        Tombol kembali dapat mudah diimplementasikan dengan menambahkan widget `ElevatedButton` yang jika ditekan, akan pop halaman tersebut.

    7) Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login

        Pertama, pada sisi server, view untuk deliver semua produk dibuat sehingga dapat dispecify melalui query apakah akan deliver produk yang dimiliki oleh pengguna saja atau semua produk dalam sistem

        Kemudian, di sisi klien mobile, dibuat state flag untuk menandakan apakah penampilkan produk perlu difilter atau tidak. state flag bernilai `true` equivalen dengan penampilan produk perlu difilter. Kemudian, dibuat widget `Switch` yang berkorespondensi dengan flag tersebut, di mana nilai awal dari `Switch` tersebut mengikuti state flag, dan setiap kali `Switch` tersebut ditoggle, callback function melakukan schedule untuk rebuild halaman dengan nilai state flag baru yang berkebalikan dari nilai state flag sebelumnya, misal dari `true` ke `false`, vica versa. Dengan demikian, fetch produk dapat dilakukan bergantung dengan state flag yang ada. Jika flag `true`, fetch akan dilakukan dengan query sedemikian sehingga produk yang dideliver adalah produk yang dimiliki oleh user saja, dan sebaliknya, jika flag `false`, fetch dilakukan dengan query yang membuat server deliver semua produk dalam sistem. Perlu ditekankan sekali lagi bahwa setiap kali toggle dilakukan, state flag berubah dan widget direbuild, sehingga dilakukan fetch ulang berdasarkan query string yang baru.  




