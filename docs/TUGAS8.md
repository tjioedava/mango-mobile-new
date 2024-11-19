# Tugas 8

1. Kegunaan dan keuntungan `const`. Kapan sebaiknya menggunakan dan tidak menggunakan `const`.

    `const` adalah keyword yang memberikan informasi ke kompilator bahwa variabel atau nilai yang dimaksud adalah konstanta dalam waktu kompilasi (<i>compile time constants</i>). Konstanta kompilasi akan disimpan dalam <i>look up cache</i> yang cepat untuk diakses. Jika terdapat pembuatan berulang suatu objek yang merupakan konstanta kompilasi, yang dilakukan sebenarnya adalah pembuatan referensi ke cache tersebut.    
    
    Jika suatu variabel diawali dengan keyword `const`, variabel tersebut harus sudah dapat diinisialisasi saat waktu kompilasi dan referensi atau nilai variabel tersebut tidak dapat diubah maupun dimodifikasi. Jika suatu nilai diawali dengan keyword `const`, nilai tersebut menjadi <i>immutable</i>.

    Keuntungan dari penggunaan keyword `const` terhadap suatu nilai atau variabel adalah sebagai berikut.

    * Peningkatan kecepatan build struktur tree.

        Dengan mendefinisikan suatu widget sebagai `const`, kompilator menjadi tahu bahwa widget yang dimaksud tidak akan berubah, sehingga alih-alih membuat widget yang sama, widget awal pada cache akan direferensikan.

    * Menurunkan penggunaan memori.

        Dari pada menyimpan banyak instance dari widget yang sama yang memakan banyak memori, keyword `const` memungkinkan referensi berulang dari widget konstan yang sama, sehingga hanya 1 instance yang perlu disimpan. 

    * Mengeliminasi interupsi saat runtime.

        Karena nilai, variabel, atau widget yang diawali `const` didefinisikan dan disimpan saat waktu kompilasi, overhead saat runtime berkurang karena nilai, variabel, atau widget yang dimaksud sudah ada secara instan tanpa harus membuatnya lagi. Hal ini membuat performa saat runtime meningkat, sehingga <i>responsiveness</i> aplikasi meningkat.

    `const` sebaiknya digunakan sebanyak mungkin, dengan tetap memerhatikan batasan-batasan berikut.

    * `const` sebaiknya digunakan saat suatu nilai sudah dapat langsung didefinisikan saat waktu kompilasi, misalnya ekspresi aritmatika dan literals. Sebaliknya, `const` jangan digunakan saat suatu nilai baru bisa dievaluasi saat runtime, misalnya promise ataupun pemanggilan fungsi.

    * `const` sebaiknya digunakan untuk suatu nilai atau widget yang memang secara tujuan penggunaan bersifat tetap dan tidak akan berubah, contohnya nama aplikasi dan icon aplikasi serta widget hiasan atau appbar yang penampilannya akan selalu sama. Sebaliknya, jika suatu nilai secara penggunaan bersifat dinamis, seperti nama produk dan rating produk, `const` sebaiknya tidak digunakan. 

2. Perbedaan dan contoh penggunaan dari widget `Column` dan `Row`

    `Column` adalah layout widget yang berfungsi mengorganisir widget-widget (yang diletakkan sebagai children dari `Column`) secara vertikal. `Row` memiliki fungsi yang mirip, dengan perbedaan layouting `Row` yang dilakukan secara horizontal. Column memiliki parameter children yang adalah list dari objek `Widget` yang posisinya akan diorganisir.

    Adapun contoh penggunaan dari widget `Column` adalah sebagai berikut.

    ```
    body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children = [
            //widget-widget yang akan diorganisir secara vertikal
            Widget1(),
            Widget2(),
            ...,
            WidgetN(),
        ],
    ),
    ```

    Contoh penggunaan dari widget `Row` sangat mirip dengan `Column`. Hanya dengan mengubah `Column` menjadi `Row` pada bongkahan kode di atas, `Row` sudah terimplementasi dengan benar, hanya saja N widget yang ada sekarang diorganisir secara horizontal.

3. Elemen input yang digunakan dan tidak digunakan

    Elemen yang digunakan:

    * TextFormField, adalah elemen input yang memungkinkan user menaruh teks, yang terintegrasikan dengan form melalui form key.

    Elemen yang tidak digunakan:

    * TextField, adalah elemen input teks dasar.
    * DropdownButton, adalah elemen input yang memberikan opsi input yang sudah ditentukan programmer atau database sebelumnya.
    * Checkbox, adalah elemen input yang terdiri dari beberapa opsi biner, dengan setiap opsi dapat dicheck oleh user.
    * Radio, adalah elemen input seperti Dropdown dengan penyajian seperti checkbox sedemikian sehingga hanya boleh 1 input yang dipilih.
    * Switch, adalah elemen input yang dapat ditoggle dan bernilai biner (ekuivalen dengan 1 checkbox).
    * Slider, adalah elemen input yang memungkinkan user memilih angka dari rentang yang ditentukan.
    * Autocomplete, adalah elemen input di mana user diberikan sugesti input berdasarkan input atau stimulus awal yang diberikannya.

4. Bagaimana mengatur tema, secara khususnya warna, supaya konsisten dalam aplikasi?

    Developer mengatur tema dengan cara menentukan warna tema utama pada class `MaterialApp` yang berfungsi untuk mendefinisikan tema dalam level aplikasi. Kemudian, `MaterialApp` akan menurunkan tema tersebut melalui `context` ke children widgetnya, sehingga widget-widget yang ada di aplikasi dapat memanfaatkan tema dari context yang sama sehingga tercipta konsistensi penggunaan warna.

5. Penanganan navigasi terhadap banyak halaman.

    Developer menangani navigasi terhadap banyak halaman dengan cara membuat drawer dan menyisipkannya di `appBar` dari layout dasar `Scaffold`. Drawer tersebut memuat button-button yang apabila diklik, akan `push` atau `pushReplacelement` halaman tertentu ke dalam class Navigator, sehingga halaman yang sedang dilihat oleh user akan terganti oleh halaman yang baru masuk ke stack. Tidak hanya melalui drawer, developer juga menyediakan beberapa button di halaman utama yang memiliki fungsionalitas yang serupa.



