# 🐳 DOCKLEARN (learn Dockerfile)

Repo ini dibuat untuk belajar dan latihan menulis **Dockerfile**, mulai dari dasar sampai konsep yang lebih fundamental. Cocok buat yang baru mulai belajar containerization pakai Docker.

---

## 📌 Apa itu Dockerfile?

**Dockerfile** adalah file teks berisi instruksi/step-by-step yang dipakai Docker untuk membangun sebuah **image**. Image ini nantinya dijalankan jadi **container** — lingkungan terisolasi yang berisi aplikasi kamu beserta semua dependency-nya.

Analogi sederhana:
- **Dockerfile** = resep masakan
- **Image** = masakan yang sudah jadi (hasil dari resep)
- **Container** = masakan itu disajikan dan dimakan (dijalankan)

---

## 🧱 Instruksi Dasar Dockerfile

| Instruksi   | Fungsi                                                              |
|-------------|----------------------------------------------------------------------|
| `FROM`      | Menentukan base image yang dipakai (misal: `node:20-alpine`)         |
| `WORKDIR`   | Menentukan direktori kerja di dalam container                        |
| `COPY`      | Menyalin file dari host ke dalam container                           |
| `ADD`       | Mirip `COPY`, tapi bisa extract file archive & download dari URL      |
| `RUN`       | Menjalankan perintah saat proses build image (misal: install deps)   |
| `ENV`       | Menyet environment variable di dalam container                      |
| `EXPOSE`    | Memberi tahu port berapa yang dipakai aplikasi di dalam container    |
| `CMD`       | Perintah default yang dijalankan saat container start                |
| `ENTRYPOINT`| Mirip `CMD`, tapi lebih rigid — cocok untuk container "executable"    |

---

## 📁 Struktur Project

```
fundamental-Docker/
├── add/
├── command/
├── copy/
├── from/
├── instruction/
├── metadata/
├── run/
├── workdir/
└── README.md
```

---

## ✍️ Contoh Dockerfile Sederhana (Node.js)

```dockerfile
# 1. Base image
FROM node:20-alpine

# 2. Direktori kerja di dalam container
WORKDIR /app

# 3. Copy package.json dulu (biar cache layer efisien)
COPY package*.json ./

# 4. Install dependency
RUN npm install

# 5. Copy semua source code
COPY . .

# 6. Port yang dipakai aplikasi
EXPOSE 3032

# 7. Perintah untuk menjalankan aplikasi
CMD ["node", "main.js"]
```

> 💡 **Tips:** Copy `package.json` duluan sebelum copy semua source code. Ini bikin Docker bisa cache layer `npm install`, jadi build selanjutnya lebih cepat kalau source code berubah tapi dependency-nya sama.

---

## 🚀 Cara Build & Jalankan

**1. Build image:**
```bash
docker build -t nama-image:tag .
```

**2. Jalankan container:**
```bash
docker run -d -p 3032:3032 --name nama-container nama-image:tag
```

> ⚠️ **Penting:** Pastikan port yang di-mapping (`-p host:container`) sesuai dengan port yang benar-benar di-`listen` oleh aplikasi kamu di dalam container. Kalau app listen di `3032` tapi mapping-nya `3032:8080`, requestnya gak akan nyampe.

**3. Cek container yang jalan:**
```bash
docker ps
```

**4. Masuk ke dalam container (debugging):**
```bash
docker exec -it nama-container bash
# kalau base image alpine dan gak ada bash:
docker exec -it nama-container sh
```

**5. Lihat log container:**
```bash
docker logs nama-container
```

**6. Stop & hapus container:**
```bash
docker stop nama-container
docker rm nama-container
```

---

## 🧹 .dockerignore

Sama seperti `.gitignore`, file ini dipakai supaya file/folder tertentu **tidak ikut ter-copy** ke dalam image saat build. Ini penting biar image lebih kecil dan build lebih cepat.

Contoh:
```
node_modules
npm-debug.log
.git
.env
```

---

## 🧠 Konsep Penting yang Perlu Dipahami

- **Layer & Cache** — Setiap instruksi di Dockerfile jadi satu layer. Docker akan cache layer yang tidak berubah, jadi urutan instruksi berpengaruh ke kecepatan build.
- **Image vs Container** — Image itu blueprint (read-only), container itu instance yang jalan dari image tersebut.
- **Port Mapping** — Format `-p HOST_PORT:CONTAINER_PORT`. Port container harus sama dengan port yang benar-benar dipakai aplikasi (`app.listen(PORT)`).
- **Multi-stage Build** — Teknik build image dalam beberapa tahap supaya image final lebih kecil (biasanya dipakai untuk production).

---

## 📚 Referensi Belajar

- [Dockerfile Reference (Docs Resmi)](https://docs.docker.com/reference/dockerfile/)
- [Docker Build Best Practices](https://docs.docker.com/build/building/best-practices/)

---

## 📝 Catatan Pribadi / Progress Belajar

- [ ] Paham konsep image vs container
- [ ] Bisa bikin Dockerfile sendiri dari nol
- [ ] Paham `.dockerignore`
- [ ] Paham port mapping
- [ ] Coba multi-stage build
- [ ] Coba docker-compose

---