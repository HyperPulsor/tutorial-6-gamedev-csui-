# Tutorial Game Development
## Authors

* **Rakan Fasya Athhar Rayyan** - *2106750950*

## Tutorial 6

### Pembuatan Menu Utama

- Menu utama dibuat menggunakan tatanan container dari **Tutorial 6** dimana menggunakan *containers*, *label*, dan *buttons* yang sama beserta pengaturan *value*-*value*nya juga. Dalam membuat *custom font* dilakukan sama seperti tutorial, tetapi membuat dua jenis.  <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/3b623899-5470-4d58-baa1-0b77c0687f77)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/6b20c724-b358-48c4-8e07-c648aacc3920)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/5b8df1e2-2903-4af3-8e03-cdc45f188fdc)

- Lalu, menambahkan container-container yang diperlukan, seperti **HBoxContainer**, **VboxContainer**, dan **CenterContainer** dan masukkan *child nodes* sesuai visualisasi menu utama yang ada pada tutorial. Lalu, menambahkan *separation* supaya antar `LinkButton` untuk **"New Game"** dan **"Stage Select"** tidak menempel. Selanjutnya, supaya tombol-tombol tersebut bisa diklik dan memiliki fungsi, masukkan *script* berikut pada kedua *button* tersebut.
```
extends LinkButton

export(String) var scene_to_load

func _on_New_Game_pressed():
    get_tree().change_scene(str("res://scenes/" + scene_to_load + ".tscn"))
```
- Akan tetapi, masukkan nama scene yang sesuai untuk masing-masing *button* (New Game -> Level 1 dan Stage Select -> Stage Select). Kemudian, jadikan `MainMenu.tscn` sebagai *scene* utama.


### Pembuatan Life Counter

- Untuk membuat suatu mekanisme jumlah nyawa dalam permainan, perlu
memiliki variabel global yang bisa diakses antar level. Oleh karena itu, dibuat global variabel berupa *lives* dalam `global.gd` yang dimana dimasukkan ke *AutoLoad*. Untuk mengakses variabel ini hanya tinggal memanggil `global.lives` pada *script* manapun. Buat scene baru bernama `Life Counter.tscn` dimana memiliki *child nodes* berupa **MarginContainer** dan **Label**. Dalam label tersebut, masukkan script bernama `LifeCounter.gd` dan update label dengan variabel global tersebut untuk setiap frame. Kemudian, buat *child node* baru berupa **CanvasLayer** yang akan dimasukkan scene `LifeCounter.tscn`. Selanjutnya, mengubah script pada `AreaTrigger.gd` sehingga permain berkurang nyawanya pada saat terjatuh dari permainan.

### Pembuatan Game Over dan Tombol Back To Menu

- Untuk membuat layar Game Over, buat scene baru bernama `Game Over.tscn`. Kemudian, tambahkan node berupa `ColorRect` dan `VboxContainer` sebagai childnya. Lalu, buat child berupa `Label` untuk tulisan "Game Over" dan `CenterContainer` yang memiliki `VboxContainer` sebagai *parent node*-nya. Dalam `CenterContainer`, masukkan `Link Button` yang berfungsi untuk mengarahkan pemain kembali ke **Main Menu**.

- Untuk menyambungkan button tersebut supaya bisa kembali ke **Main Menu**, masukkan *script* yang sama seperti sebelumnya (*load scene* berdasarkan nama), lalu ubah *scene* tujuan menjadi **Main Menu**. Kemudian, buat signal baru `pressed()` dan masukkan kode mengubah scene dalam kode yang berkoresponden dengan signal tersebut pada *script*. <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/830630bd-4793-4326-bd4d-ca2c1496777f)

### Pembuatan Fitur Select Stage

- Pertama, buat scene baru untuk menghandle pemilihan level oleh pemain yang dinamakan `StageSelect.tscn`. Kemudian, susun dengan menggunakan `MarginContainer`, `HBoxContainer`, dan `LinkButton` yang merepresentasikan level yang ada. Mirip dengan sebelumnya, tombol dimasukkan *script* mengubah *scene* berdasarkan nama dan dibuat *signal* `pressed()` untuk merubah scene berdasarkan tombol mana yang diklik.
<br> </br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/f4af973f-f91c-4e8a-808b-c873d4e70493)

### Pembuatan Fitur Layar dan Efek Transisi

- Pada fitur ini, akan dibuat efek transisi saat pemain jatuh ke bawah permainan dan saat pemain berhasil mencapai level baru. Untuk membuat efek ini, dibuat scene `SceneTransition.tscn`. *Scene* ini memiliki *root node* berupa `CanvasLayer` yang memiliki *child nodes* berupa `ColorRect`, `AnimationPlayer`, dan `Sprite`. Efek transisi ini akan dibaut dengan menggunakan *keyframe* animasi.
<br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/c06d7adf-9360-478d-a35c-07bff2577195)

- Buat animasi baru yang dinamakan **dissolve** dan **fadeout**. Animasi **dissolve** dimulai dengan memasukkan keyframe pada atribut `Modulate` dari `ColorRect` dimana dibuat menjadi tidak terlihat dengan membuat **Alpha** menjadi 0. Pada bagian akhir animasi, dibuat **Alpha** menjadi 255 sehingga terlihat. Beirkut merupakan hasil akhir animasi.
<br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/3e1ba490-4870-4c6a-a989-2fbf66e37f64)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/b13cb881-b561-4f0c-a38d-83f503bbb938)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/569bc8e7-da41-436b-a000-a7356086af4b) <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/b5174fb3-e0ff-4f91-9231-6cc35cecd0b9)

- Untuk animasi **fadeout**, lakukan hal yang sama, tetapi untuk `Sprite`. <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/011cad99-bd07-4794-ba1a-58da042472f3)

- Untuk merealisasikan animasi, buat *script* dinamakan `SceneTransition.gd` pada `SceneTransition`. Isi dari *script* ini adalah merubah scene dengan disertakan tipe animasi yang diinginkan. Parameter *target* berfungsi untuk menunjukkan *scene* tujuan dan *type* yang berfungsi untuk memilih tipe animasi. Berikut merupakan isi dari *script*-nya. Setelah itu, masukkan ke **AutoLoad** supaya bisa diakses oleh semua *script*.<br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/8fd40971-8d3f-4b5c-b1e4-5028988fcea0)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/57a515d2-0eb9-48d7-87e5-1e158cea4dde)

- Lalu, update kode pada `Area2D.gd`, supaya menggunakan perubahan scene dari `SceneTransition`. Untuk animasi *dissolve*, akan digunakan pada saat pemain kalah atau *game over*. Sedangkan kondisi perubahan level dan jatuh dari *map*, menggunakan animasi *fadeout*.<br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/707cef3b-db78-4468-ba05-26207ab5ec53)

### Pembuatan Fitur Pause Menu

- Fitur ini berfungsi untuk melakukan *pause* sementara pada saat permainan berlangsung dengan menekan tombol **Escape**. Berikut merupakan struktur dari *scene* dimana terdapat *root node* `Control` dan *child node* yaitu `ColorRect`, `CenterContainer`, `VBoxContainer`, `Label`, `Control` (sebagai spacing antar label dan button), dan `Button`. Sebelum memasukkan *script*, masukkan **InputMap** dengan nama *pause* dan key tombol **Escape**. Buat *script* baru dengan nama `Pause.gd` dengan **signal**-**signal** dari button.
<br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/246619e7-65a5-43d7-9c6f-accdb42163e0)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/a82be03e-fc29-47a7-bced-9ecef4cb463b)

- Masukkan *script* sebagai berikut dimana terdapat variabel dari `is_paused` akan memanggil fungsi `set_is_paused` setiap kali variabel tersebut berubah nilainya (menggunakan setget/ getter dan setter). Kemudian, *handle* input dari InputMap akan mengubah nilai variabel tersebut menjadi kebalikannya. Selanjutnya, saat tombol Resume dilik maka merubah variabel `is_paused` menjadi false dan saat tombol Quit diklik maka akan menutup permainan. <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/4658c3fd-95a7-4e12-a1de-5340a118ff21)

- Masukkan scene `PauseMenu` ini ke dalam setiap level dan pastikan bahwa dibuat menjadi tidak terlihat di awal atau tidak *visible* dengan menekan simbol mata di bagian kanan sebelah simbol *script*. <br></br>
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/d1368cae-e212-4f46-b71e-59c79dc6e8e6)
![image](https://github.com/HyperPulsor/tutorial-6-gamedev-csui-/assets/101686378/0f4188d4-2138-40cd-956e-a297bafa5f40)



