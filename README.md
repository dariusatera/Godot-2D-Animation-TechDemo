# 🧙‍♀️ 2D Animation & AI Movement Tech Demo (Godot 4 & Aseprite)

![Godot Engine](https://img.shields.io/badge/Godot-4.x-blue?logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/Language-GDScript-green)
![Aseprite](https://img.shields.io/badge/Art-Aseprite-ff9900)

**2D Animation Tech Demo** adalah sebuah proyek eksperimental untuk menguji integrasi *pipeline* desain visual 2D (Pixel Art) ke dalam *game engine*. Proyek ini difokuskan pada pengujian transisi animasi, pemrograman *Artificial Intelligence* (AI) pergerakan musuh yang responsif, serta implementasi *custom shader* pada Godot Engine 4.

---

## 🎥 Demo Video & Gameplay
*(Hapus teks ini dan masukkan link GIF/MP4 rekaman layar Godot kamu saat di-play. Contoh format: `![Demo Pergerakan](nama-file-gif.gif)`)*

---

## 📸 Tangkapan Layar (Screenshots)
*(Hapus teks ini dan lampirkan screenshot dari dalam engine Godot atau Aseprite. Tunjukkan area Node/Scene dan kodingan GDScript-mu)*

| Kodingan & Node Tree | Hasil Render In-Game |
| :---: | :---: |
| `![Node Tree](link-gambar-1.png)` | `![In Game](link-gambar-2.png)` |

---

## ⚙️ Fitur Mekanik & Teknis yang Diuji

Sebagai *Technical Game Designer*, proyek ini membuktikan pemahaman logika komputasi visual melalui implementasi berikut:

1. **Aseprite to Godot Pipeline:** Integrasi *sprite sheet* (contoh: `idleWitch-sheet.png`) ke dalam node `AnimatedSprite2D` tanpa kehilangan ketajaman *pixel art*.
2. **AI Chasing Mechanic:** Menggunakan `CharacterBody2D` dan matematika vektor (`position.distance_to()`, `normalized()`) untuk membuat musuh dapat mengejar target (*Witch*) secara dinamis.
3. **State Machine Sederhana:** Logika otomatis yang mengubah animasi dari status `"idle"` menjadi `"walk"` secara *real-time* berdasarkan kecepatan dan jarak (*velocity*).
4. **Custom 2D Shaders:** Menggunakan `ShaderMaterial` khusus (`witch.gdshader`) untuk memberikan efek visual tingkat lanjut pada aset 2D.

---

## 🚀 Cara Setup dan Menjalankan Proyek (How to Run)

Proyek ini dibangun menggunakan **Godot 4.x**. Ikuti langkah berikut untuk menjalankan purwarupa ini di komputer Anda:

### Persiapan
1. Pastikan Anda telah menginstal **Godot Engine versi 4.x** (disarankan versi 4.2 ke atas).
2. Lakukan *Clone* atau *Download ZIP* repositori ini ke komputer Anda:
   ```bash
   git clone [https://github.com/dariusatera/Godot-2D-Animation-TechDemo.git](https://github.com/dariusatera/Godot-2D-Animation-TechDemo.git)
