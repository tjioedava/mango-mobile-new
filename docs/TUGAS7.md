# Tugas 7

1. Pengertian dan perbedaan stateless dan stateful widget

    Stateless widget adalah widget yang bersifat statis, di mana tampilan objek dari widget tersebut akan selalu sama, tidak peduli seberapa banyak widget tersebut di-rebuild. State dari widget tersebut tidak dapat berubah. 

    Stateful widget adalah widget yang memiliki state mutable (dapat berubah). Terdapat method setState() yang memungkinkan adanya perubahan state sehingga tampilan widget dapat berubah ketika direbuild berdasarkan state terbarunya.

    Adapun perbedaan stateless dengan stateful widget dijelaskan di bawah ini.
    - Stateless widget tidak memiliki class tambahan untuk mendefinisikan state yang tidak dapat berubahnya, sedangkan stateful widget memiliki class tambahan yang hanya visible di library widget tersebut untuk mendefinisikan konten dari widget berdasarkan state. 
    - Sepanjang masa hidup widget, stateless widget tidak dapat berubah, sedangkan stateful widget dapat berubah apabila terdapat perubahan state yang men-trigger rebuild.
    - Stateless widget hanya di-rebuild pada awal-awal atau saat parent widget yang statefulnya di-rebuild, sedangkan stateful widget dapat di-rebuild juga saat method setState() dipanggil.
    - Stateless widget bersifat lebih ringan dibandingkan stateful widget, sehingga proses render stateless widget lebih cepat.

2. Widget-widget yang digunakan adalah sebagai berikut

    - MyApp 

        `MyApp` adalah stateless widget yang merepresentasikan page aplikasi secara keseluruhan. Widget ini dijadikan parameter fungsi global `RunApp`, dengan tujuan menampilkan aplikasi tersebut.

    - MyHomePage

        `MyHomePage` adalah stateless widget yang merepresentasikan home page (cukup self-descriptive). `MyHomePage` ini akan berisikan bar dan konten utama beserta button-button. Widget ini memiliki atribut title yang dispecify saat instansiasi dan akan dirujuk saat pembuatan bar aplikasi. Widget ini juga memiliki atribut berupa objek informasi terkait button, yang akan dirujuk saat membuat button dalam widget tersebut. 

    - Scaffold 
        
        `Scaffold` adalah widget yang berfungsi untuk memberikan struktur layouting dengan appbar dan body. Dalam hal ini, `Scaffold` berperan sebagai widget API yang memberikan kerangka layouting.

    - AppBar

        `AppBar` adalah widget berupa persegi panjang yang biasanya terletak di bagian atas halaman. Dalam kode ini, widget `AppBar` diletakkan di parameter yang sesuai dengan struktur dari `Scaffold`. 

    - Center

        `Center` adalah widget yang membungkus widget anaknya dan memposisikannya di tengah untuk keperluan layouting. `Center` hanya menerima 1 anak / child.

    - Column 

        `Column` adalah widget yang menyusun childrennya secara vertikal layaknya sebuah kolom, yang penyusunan dan alignmentnya dapat diatur melalui parameter yang sesuai. Column dapat menerima banyak anak / children.

    - ItemCard

        `ItemCard` adalah stateless widget buatan sendiri yang merepresentasikan button. `ItemCard` memiliki atribut wajib `item` yang menyimpan informasi tentang button tersebut. `ItemCard` melakukan `build` dengan merujuk informasi yang disediakan di atribut `item` dan menggunakan informasi tersebut untuk membuat icon dan text serta menyetel warna yang sesuai. 

    - Inkwell

        `Inkwell` adalah widget yang dapat merespons tekanan / tap, yang dalam kode ini menghandlenya dengan menampilkan pesan melalui `SnackBar`

    - MaterialApp

        `MaterialApp` adalah widget yang mengonfigurasi styling, tema, dan navigasi dalam level aplikasi (application level). `MaterialApp` 'membungkus' childnya dan mendefinisikan konfigurasi melalui parameter elevation, color, shape, dll.

    - Material

        `Material` adalah widget yang mengonfigurasi styling dan tema dari area widget-widget tertentu. Berbeda dengan `MaterialApp`, jangkauan dari material hanyalah kelompok widget tertentu. 

    - Text

        `Text` adalah stateless widget yang menampilkan teks dasar dengan parameter konten dari teks tersebut, warna, alignment, dll.

    - Container

        `Container` adalah widget yang membungkus suatu widget dan memungkinkan alignment dari widget tersebut.

    - GridView

        `GridView` adalah widget yang menyusun children widgetnya dalam bentuk tabel 2 dimensi.

3. Kegunaan dari method `setState()` dan variabel yang terpengaruh oleh method tersebut.

    Method `setState()` adalah method yang dimiliki oleh private class State yang membuat jadwal rebuild untuk corresponding widgetnya. Secara detailnya, method ini memiliki parameter berupa callback function. Callback function tersebut akan berisikan instruksi untuk mengubah state itu sendiri yang didefinisikan dalam field property dari class State, misal fungsi yang melakukan increment field `_counter`. Ketika `setState()` dijalankan, callback function tersebut akan dipanggil dan state berubah. Setelah itu, `setState()` akan menjadwalkan rebuild sehingga widget akan terupdate sesuai dengan state yang telah berubah, misal tampilan angka berubah dari 20 menjadi 21.

    `setState()` tidak secara langsung memengaruhi variabel manapun yang didefinisikan dalam State class. `setState()` hanya sekadar melakukan penjadwalan untuk rebuild widget, yang didahului dengan pemanggilan callback function. Adapun callback function melakukan modifikasi terhadap field-field yang terdapat pada class State, yang merepresentasikan state itu sendiri, misalnya increment counter atau mengubah warna.

4. Perbedaan `const` dengan `final`

    `const` adalah keyword yang mengatur variabel sedemikian sehingga variabel tersebut bersifat immutable (tidak dapat diubah), yang nilainya dievaluasi saat kompilasi kode. `final` adalah keyword yang membuat variabel hanya bisa diassign dengan suatu nilai hanya 1 kali. Berikut adalah perbedaan secara perbandingan antara `const` dan `final`.

    - Baik reference dari variabel dengan keyword `const` maupun nilai dari reference tersebut tidak dapat berubah, karena variabel beserta nilai reference dari variabel tersebut bersifat immutable. Di sisi lain, variabel dengan keyword `final` memiliki reference yang tidak dapat berubah namun nilai dari reference itu sendiri masih dapat berubah. Melalui perspektif lain, dapat dikatakan bahwa `const` secara implisit adalah `final` juga, tetapi tidak berlaku sebaliknya.

    - Nilai dari variabel dengan keyword `const` harus sudah dapat didefinisikan saat waktu kompilasi, atau dengan kata lain harus berupa ekspresi yang terdefinisi saat kompilasi, misal `2`, `"string"`, dan `1 + 3`, sedangkan nilai dari variabel dengan keyword `final` dapat didefinisikan saat runtime. Sebagai konsekuensinya, developer tidak dapat assign ekspresi return value dari sebuah function kepada variabel dengan keyword `const`, karena evaluasi ekspresi tersebut harus dilakukan saat runtime, sedangkan saat compile time, ekspresi tersebut masih indeterminate. 

    - Variabel dengan keyword `const` biasa disebut sebagai compile constant, sedangkan variabel dengan keyword `final` biasa disebut sebagai runtime constant.

5. Penjelasan implementasi secara step-by-step

    1. Inisialisasi project flutter baru
        
        Developer menginisialisasi project flutter baru dengan menciptakan workspace baru di situs project IDX. Server kemudian membuat project flutter baru yang siap untuk dikerjakan.

    2. Refactoring struktur project yang ada

        Code yang sudah ada yang terdapat pada direktori `lib` di-refactor oleh developer. Daripada mendefinisikan widget halaman homepage pada 1 file yang sama dengan fungsi main, developer membuat file baru bernama `menu.dart` yang terdedikasi untuk mendefinisikan widget homepage beserta widget pembantunya saja, sehingga file `main.dart` dapat lebih difokuskan untuk menampilkan widget homepage tersebut melalui main function dan mengonfigurasi tema, styling, dan navigasi secara application-level.

    3. Mengubah home page yang awalnya stateful menjadi stateless

        Pada pre-existing program sebagai demonstrasi, widget utama berupa stateful karena memiliki state angka dan dapat diincrement saat suatu tombol diklik. Namun, karena kita tidak memerlukan fungsionalitas tersebut, widget utama diubah menjadi stateless, dan class state turunan dari widget tersebut dihapus. Selain itu, kode tampilan dari widget utama dipindahkan dari class state ke class widget itu sendiri. 

    4. Membuat widget sendiri yang merepresentasikan button

        Developer membuat widget bernama `ItemCard` yang merepresentasikan button dan memiliki atribut item instance class `ItemHomePage` yang menyimpan informasi mengenai title dan ikon beserta warna yang akan diterapkan untuk widget button itu sendiri. Kemudian, widget tersebut ditampilan di widget utama, dengan instance dari `ItemHomePage` yang didefinisikan di field widget utama. Warna yang didefinisikan melalui instance `ItemHomePage` dibuat berbeda-beda.

    5. Membuat button menampilkan snackbar saat ditekan

        Developer membuat implementasi widget button menjadi "terbungkus" dengan widget `Inkwell`, supaya button dapat merespon aksi tekan dari pengguna. Developer membuat fungsi callback yang menampilkan snackbar dengan pesan berdasarkan informasi dari button yang ditekan dan menyembunyikan snackbar yang sudah ada sebelumnya supaya tidak ada double snackbar, dan fungsi tersebut dijadikan sebagai nilai dari parameter ontap dalam widget `InkWell`. Dengan demikian, setiap kali widget button ditekan, snackbar akan ditampilkan.