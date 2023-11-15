# Praktikum Jaringan Komputer 2023

**Kelompok IT08**

Nama Anggota Kelompok | NRP
------------------- | --------------		
Aqil Sulthan Yuki Maye | 5027211007
Adimas Defatra Bimasena | 5027211040

 Kelompok | Prefix IP 
----------|-----------
 IT08      | 192.237   

## Modul 3

## Daftar Soal :
- [Soal 0](#soal-0)
- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)
- [Soal 9](#soal-9)
- [Soal 10](#soal-10)
- [Soal 11](#soal-11)
- [Soal 12](#soal-12)
- [Soal 13](#soal-13)
- [Soal 14](#soal-14)
- [Soal 15](#soal-15)
- [Soal 16](#soal-16)
- [Soal 17](#soal-17)
- [Soal 18](#soal-18)
- [Soal 19](#soal-19)
- [Soal 20](#soal-20)

---

### Topologi
![Foto](./img/topologi.png)

### Soal 0
Setelah mengalahkan Demon King, perjalanan berlanjut. Kali ini, kalian diminta untuk melakukan register domain berupa riegel.canyon.yyy.com untuk worker PHP dan granz.channel.yyy.com untuk worker Laravel mengarah pada worker yang memiliki IP [prefix IP].x.1.
- Penjelasan:
![Foto](./img/0.png)

---
### Soal 1
Lakukan konfigurasi sesuai dengan peta yang sudah diberikan. 

Kemudian, karena masih banyak spell yang harus dikumpulkan, bantulah para petualang untuk memenuhi kriteria berikut :

Semua CLIENT harus menggunakan konfigurasi dari DHCP Server.
- Penjelasan:
![Foto](./img/1.png)

---
### Soal 2
Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80
- Penjelasan:
![Foto](./img/2.png)

---
### Soal 3
Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168
- Penjelasan:
![Foto](./img/3.png)

---
### Soal 4 
Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut
- Penjelasan:
![Foto](./img/4.png)

---
### Soal 5
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit 

Berjalannya waktu, petualang diminta untuk melakukan deployment.
- Penjelasan:
![Foto](./img/5.png)

---
### Soal 6
Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3.
- Penjelasan:
![Foto](./img/6.png)

---
### Soal 7
Kepala suku dari Bredt Region memberikan resource server sebagai berikut:
a. Lawine, 4GB, 2vCPU, dan 80 GB SSD.
b. Linie, 2GB, 2vCPU, dan 50 GB SSD.
c. Lugner 1GB, 1vCPU, dan 25 GB SSD.
aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second.
- Penjelasan:
![Foto](./img/7.png)

---
### Soal 8
Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
a. Nama Algoritma Load Balancer
b. Report hasil testing pada Apache Benchmark
c. Grafik request per second untuk masing masing algoritma. 
d. Analisis
- Penjelasan:
![Foto](./img/8.png)

---
### Soal 9
Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire.
- Penjelasan:
![Foto](./img/9.png)

---
### Soal 10
Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/
- Penjelasan:
![Foto](./img/10.png)

---
### Soal 11
Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id.
- Penjelasan:
![Foto](./img/11.png)

---
### Soal 12
Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP.3.69], [Prefix IP.3.70], [Prefix IP.4.167], dan [Prefix IP.4.168].

Karena para petualang kehabisan uang, mereka kembali bekerja untuk mengatur granz.channel.yyy.com.
- Penjelasan:
![Foto](./img/12.png)

---
### Soal 13 
Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern.
- Penjelasan:
![Foto](./img/13.png)

---
### Soal 14 
Frieren, Flamme, dan Fern memiliki Granz Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer

Granz Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.
- Penjelasan:
![Foto](./img/14.png)

---
### Soal 15
POST /auth/register
- Penjelasan:
![Foto](./img/15.png)

---
### Soal 16 
POST /auth/login
- Penjelasan:
![Foto](./img/16.png)

---
### Soal 17
GET /me
- Penjelasan:
![Foto](./img/17.png)

---
### Soal 18
Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Granz Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern.
- Penjelasan:
![Foto](./img/18.png)

---
### Soal 19
Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan 
- pm.max_children
- pm.start_servers
- pm.min_spare_servers
- pm.max_spare_servers
sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.
- Penjelasan:
![Foto](./img/19.png)

---
### Soal 20
Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second.
- Penjelasan:
![Foto](./img/20.png)