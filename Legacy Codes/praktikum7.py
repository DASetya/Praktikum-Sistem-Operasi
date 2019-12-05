from os import getpid
from time import time, sleep
from multiprocessing import Pool, Process

def modulus(angka):
    global mboh

    if angka % mboh == 0:
        print(angka**2," - ID proses", getpid())
    else:
        print(angka, "ID proses", getpid())
    sleep(1)

if __name__ == '__main__':
    mboh = int(input("Masukkan modulus loop: "))
    angka = int(input("Masukkan batas A kuadrat: "))
    # PEMROSESAN SEKUENSIAL
    print("\nPemrosesan Sekuensial")
    sekuensial_awal = time()

    for i in range(1,(angka**2)+1):
        modulus(i)

    sekuensial_akhir= time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.process
    print("\nPemrosesan Paralel dengan multiprocessing.process")
    kumpulan_proses = []

    process_awal = time()

    for i in range(1,(angka**2)+1):
        p = Process(target=modulus, args=(i,))
        kumpulan_proses.append(p)
        p.start()

    for i in kumpulan_proses:
        p.join()

    process_akhir = time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.pool
    print("\nPemrosesan Paralel dengan multiprocessing.pool")
    pool_awal = time()
    
    pool = Pool()
    pool.map(modulus, range(1,(angka**2)+1))
    pool.close()

    pool_akhir = time()
    
print("\nSekuensial", sekuensial_akhir-sekuensial_awal, "detik")
print("multiprocessing.process", process_akhir-process_awal, "detik")
print("multiprocessing.pool", pool_akhir-pool_awal, "detik")

