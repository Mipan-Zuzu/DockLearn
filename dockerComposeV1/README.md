## Docker Compose `Awal`

# Compose Create & Run

Running docker compose `create sekalian running backgorund`
```bash
    docker compose up -d
```
container `nginx-example dan nginx-example2` otoamtis jalan di backgorund 

# Cek Container 

Untuk `cek container yang sedang jalan`

```bash
    docker container ps
```

untuk `cek semua container baik yang mati dan hidup`

```bash
    docker container ps -a
```

# Masuk ke terminal container 

contoh masuk ke bash `nginx` `redis` dll
```bash
    docker container exec -it nama-container bash
    
    docker container exec -it nama-container ash
```

# Compose stop & kill

Stop and Kill Container  ini untuk `matikan dan hapus container`
```bash
    docker compose down
```

Container langsung mati dan hilang karena `di hapus`    

# Compose Stop

stop container `container di matikan tapi masih tetap ada` karena hanya di `stop`
```bash
    docker container stop name-container
```

langsung `mati` tapi masih `tetap ada`

# Compose Start

Start Container `jalankan container yang sudah ada` 
```bash 
    docker container start nama-container
```
container otomatis `jalan lagi`

