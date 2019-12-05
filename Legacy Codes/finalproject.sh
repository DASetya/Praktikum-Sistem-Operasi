#source code final project
#Sistem Operasi Paralel B
#Dimas Arif Setyawan
#18081010093

programberguna(){
declare -a matriks_satu
declare -a matriks_dua
declare -a matriks_tiga

while [[ pilih=1 ]];do
clear

echo "Menu Program: "
echo "1. Masukkan nilai kedua matriks"
echo "2. Lihat penjumlahan kedua matriks"
echo "3. Lihat nilai hasil perkalian kedua matriks"
echo "4. Keluar program"
echo -n "Pilih menu : "
read pilih

case $pilih in
	1 )
	clear
	echo "Masukkan nilai pada matriks satu :"
	for ((i=0; i<=3; i++)) do
		echo "Nilai ke "$(( $i + 1))
		read nilai
		
		matriks_satu[$i]=$nilai
	done
	
	echo ""
	echo "Masukkan nilai pada matriks dua :"
	for ((i=0; i<=3; i++)) do
		echo "Nilai ke "$(( $i + 1))
		read nilai
		
		matriks_dua[$i]=$nilai
	done
		;;
	2 )
	clear
	for ((i=0; i<4; i++)) do
		let matriks_tiga[$i]=matriks_satu[$i]+matriks_dua[$i]
	done
	
	echo "Hasil Penjumlahan"
	for ((i=0; i<4; i++)) do
		echo -n "${matriks_tiga[$i]} "

		if [ $i == 1 ]
		then
			echo ""
		fi
	done
	unset matriks_tiga
	read
		;;
	3 )
	clear
	for ((i=0; i<2; i++)) do
		for ((j=0; j<2; j++)) do
			let matriks_tiga[$i]+=matriks_satu[$j]*matriks_dua[$i+$j*2]
		done
	done

	for ((i=0; i<2; i++)) do
		for ((j=0; j<2; j++)) do
			let matriks_tiga[$i+2]+=matriks_satu[$j+2]*matriks_dua[$i+$j*2]
		done	
	done
	
	echo "Hasil perkalian"
	for ((i=0; i<4; i++)) do
		echo -n "${matriks_tiga[$i]} "

		if [ $i == 1 ]
		then
			echo ""
		fi
	done
	unset matriks_tiga
	read
		;;
	4 )
	echo "Terima Kasih"
	break
		;;
esac
done
}

penerapansisop(){
userbaru(){
	echo "Masukkan nama user baru : "
	read userbaru
	sudo adduser $userbaru
}

masukuser(){
	ls /home
	echo "Mau masuk ke user yang mana? "
	read masukuser
	su $masukuser
}

deadlock(){
	echo "Sudah dibilangin jangan dipilih nanti bakalan deadlock"
	echo "Kalau sudah deadlock, tekan saja Ctrl+C untuk cancel programnya"
	echo "YAKIN MAU COBA DEADLOCK? (y/n)"
	read yakindead
	if [[ $yakindead == y ]]; then
	while :; do

	dd if=out.fifo bs=1b count=1 2>/dev/null | grep $1

	if [ $?  -eq 0 ]; then

	echo “$2” > in.fifo exit 0

	fi

	done
	fi
	if [[ $yakindead != y ]]; then
		echo "Tuhkan  Cemen"
	fi
}

installapp(){
	echo "Masukkan aplikasi yang akan diinstall : "
	read installapp
	sudo apt install $installapp
}

bukaapp(){
	echo "Masukkan nama aplikasi yang ingin dibuka : "
	read bukaapp
	$bukaapp
}

hapususer(){
	ls /home
	echo "Masukkan nama user yang ingin dihapus : "
	read hapususer
	deluser --remove-home $hapususer
}
while [[ pilih=1 ]]; do
	clear
	echo "==============================================="
	echo "		Menu program 								"
	echo "==============================================="
	echo "1. Membuat user baru"
	echo "2. Masuk ke user lain"
	echo "3. Hapus user"
	echo "4. JANGAN DIPILIH. NANTI DEADLOCK LOHHH"
	echo "5. Menginstall aplikasi"
	echo "6. Membuka aplikasi"
	echo "7. Melihat folder dan file dalam computer"
	echo "8. exit program"
	echo "==============================================="
	echo -n "Masukkan pilihan menu "
	read pilih

	case $pilih in
		1 )
		clear
		userbaru
			;;
		2 )
		clear
		masukuser
			;;
		3 )
		clear
		hapususer
		;;
		4 )
		deadlock
		clear
			;;
		5 )
		clear
		installapp
		;;
		6 )
		bukaapp
		;;
		7 )
		cd
		while [[ file=1 ]]; do
		clear
		ls -l
		echo ""
		echo "Jika ingin kembali ke folder sebelumnya, tekan p"
		echo ""
		echo "Jika ingin ke menu tekan m"
		echo -n "Masukkan nama folder yang ingin dibuka : "
		read folder
		cd $folder
		if [[ $folder == p ]]; then
			cd ..
		fi
		if [[ $folder == m ]]; then
			break
		fi
		done
		;;
		8 )
		clear
		break
		;;
	esac
done	
}
while true
do
clear
echo "=============================================="
echo "		Menu Program 					"
echo "=============================================="
echo "1. Program penjumlahan dan pengurangan matriks"
echo "2. Program penerapan sistem operasi"
echo "3. exit program"
echo -n "Masukkan pilihan program "
read pilih
case $pilih in
	1 )
	programberguna
		;;
	2 )
	penerapansisop
		;;
	3 )
	echo "Terima kasih"
	exit
		;;
esac
done


