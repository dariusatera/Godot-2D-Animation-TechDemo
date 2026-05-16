# 🧙‍♀️ Witch 2D  (Godot 4 & Aseprite)

![Godot Engine](https://img.shields.io/badge/Godot-4.x-blue?logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/Language-GDScript-green)
![Aseprite](https://img.shields.io/badge/Art-Aseprite-ff9900)

Ini adalah proyek eksperimental seru-seruan untuk menguji integrasi pipeline Pixel Art (Aseprite) ke Godot Engine 4
Di game ini, kamu bakal mengendalikan seorang Witch yang tiba-tiba spawn di tengah map misterius. Gak lama kemudian, clone Witch musuh bakal bermunculan secara acak dan langsung mengejar kamu! Tugasmu? Bantai mereka semua pakai tembakan Fireball sebanyak-banyaknya! 💥 Jangan khawatir, Witch kamu immortal alias kebal dan nggak bisa mati kok, jadi game ini murni jadi arena sandbox yang asik buat seru-seruan, eksperimen mekanik combat, dan mengasah logika game development!

---

## 🎥 Demo Video & Gameplay
-_-

---

## 📸 Tangkapan Layar (Screenshots)
-_-


---

## ⌨️ Kontrol Permainan (Controls)

Mekanik kontrol di game ini didesain adaptif dan responsif layaknya game action/MOBA modern:
* **Klik Kanan (Right Click):** Berjalan menuju titik tujuan di map (Dota-style *Click-to-Move*). Karakter akan otomatis bergerak ke arah koordinat yang diklik.
* **Klik Kiri (Left Click):** Menembakkan *Fireball* magis ke arah kursor mouse untuk mengeliminasi musuh!

---

## ⚙️ Fitur Mekanik & Teknis yang Diuji

Sebagai proyek eksperimen, ada banyak logika komputasi visual dan gameplay menarik yang diimplementasikan di sini:

1. **Aseprite to Godot Pipeline:** Integrasi *sprite sheet* animasi (`idleWitch-sheet.png`, dll) langsung ke node `AnimatedSprite2D` dengan pengaturan tekstur yang tetap tajam khas *pixel art* tanpa blur.
2. **Dota-Style Click-to-Move:** Menggunakan kalkulasi posisi mouse global (`get_global_mouse_position()`) dan matematika vektor untuk menggerakkan `CharacterBody2D` secara mulus ke target koordinat yang diklik oleh pemain.
3. **Combat & Projectile Mechanic:** Instansiasi proyektil *Fireball* secara real-time yang melesat ke arah posisi mouse saat klik kiri ditekan, lengkap dengan deteksi tabrakan (*collision detection*) untuk menghancurkan musuh.
4. **Random Enemy Spawning:** Logika otomatis menggunakan *Timer* dan koordinat acak (*randomize range*) untuk memunculkan clone musuh secara dinamis di berbagai titik area map.
5. **AI Chasing Mechanic:** Pergerakan AI musuh yang agresif menggunakan fungsi matematika vektor (`position.distance_to()` dan `.normalized()`) agar mereka selalu melacak dan mengejar posisi koordinat player secara dinamis.
6. **State Machine Sederhana:** Mengatur transisi animasi `"idle"`, `"walk"`, dan `"attack"` secara otomatis berdasarkan kalkulasi kecepatan (*velocity*) dan status aksi dari karakter secara real-time.
7. **Custom 2D Shaders:** Penggunaan `ShaderMaterial` (`witch.gdshader`) untuk memberikan efek visual tingkat lanjut (seperti efek magis atau kilatan cahaya) pada aset 2D.

---

## 🚀 Cara Setup dan Menjalankan Proyek (How to Run)

Proyek ini dibangun menggunakan **Godot 4.x**. Ikuti langkah mudah berikut untuk menjalankan purwarupa ini di komputer kamu:

### Persiapan
1. Pastikan kamu sudah menginstal **Godot Engine versi 4.x** (sangat disarankan versi 4.2 ke atas).
2. Lakukan *Clone* atau *Download ZIP* repositori ini ke komputer kamu:
   ```bash
   git clone [https://github.com/dariusatera/Godot-2D-Animation-TechDemo.git](https://github.com/dariusatera/Godot-2D-Animation-TechDemo.git)
3. Buka Godot Engine, pilih Import, lalu arahkan ke folder proyek ini dan pilih file project.godot.

4. Klik Edit dan tekan tombol F5 (atau klik ikon Play di pojok kanan atas) untuk langsung mencoba dan menguji gamenya!

💡 Proyek ini murni dibuat untuk tujuan belajar, eksplorasi mekanik engine, dan bersenang-senang! Feel free to tweak the code and make it even cooler!
