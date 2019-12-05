#!/bin/bash
echo "Program Bash Kalkulator"
while [[ Pilih=1 ]]; do
echo "1. Menu Kalkulator Loop"
echo "2. Exit Program"
echo -n "Pilih menu: "
read Pilih
case $Pilih in
    1 )
    echo -n "Masukkan Bilangan Acuan: "
    read a
    echo -n "Masukkan Batasan Loop: "
    read b
    echo "Penjumlahan"
    for (( i=1 ; i <= b; i=i+1 )); do
    let c=$a+$i
    echo "$a + $i = $c"
    done
    echo "Pengurangan"
    for (( i=1 ; i <= b; i=i+1 )); do
    let d=$a-$i
    echo "$a - $i = $d"
    done
    echo "Pembagian"
    for (( i=1; i <= b; i=i+1 )); do
    let e=$a/$i
    echo "$a / $i = $e"
    done
    echo "Perkalian"
    for (( i=1; i <= b; i=i+1 )); do
    let f=$a*$i
    echo "$a * $i = $f"
    done
    ;;
    2)
    echo "Terima Kasih :)"
    break;;
esac
done

