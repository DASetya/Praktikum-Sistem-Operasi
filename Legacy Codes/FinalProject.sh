#source code final project
#Sistem Operasi Paralel B
#Dimas Arif Setyawan
#18081010093

programberguna(){

atm(){
echo "1. Bolpoin		Rp.5000"
echo "2. Pensil		Rp.4000"
echo "3. Spidol		Rp.6000"
echo "4. Tipe X		Rp.5000"
echo "5. Penggaris		Rp.3500"
echo -n "Masukkan barang yang anda pilih: "
read pilih1
	case $pilih1 in
		1 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak1
		let jumlah1=5000*$banyak1
			;;
		2 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak1
		let jumlah1=4000*$banyak1
			;;
		3 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak1
		let jumlah1=6000*$banyak1		
			;;
		4 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak1
		let jumlah1=5000*$banyak1		
			;;
		5 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak1
		let jumlah1=3500*$banyak1	
			;;
	esac
	let total1+=$jumlah1
}

sekolah(){
echo "1. Sepatu Sekolah	Rp.205000"
echo "2. Tas Sekolah		Rp.210000"
echo "3. Hasduk		Rp.10000"
echo "4. Dasi Sekolah 	Rp.8000"
echo "5. Topi Sekolah 	Rp.7000"
echo -n "Masukkan barang yang anda pilih: "
read pilih2
	case $pilih2 in
		1 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak2
		let jumlah2=205000*$banyak2
			;;
		2 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak2
		let jumlah2=210000*$banyak2
			;;
		3 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak2
		let jumlah2=10000*$banyak2
			;;
		4 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak2
		let jumlah2=8000*$banyak2
			;;
		5 )
		echo -n "Masukkan jumlah barang pilihan: "
		read banyak2
		let jumlah2=7000*$banyak2
			;;
	esac
	let total2+=$jumlah2
}

while [[ pilih=1 ]];do
clear
echo "SELAMAT DATANG DI PROGRAM STATIONERY"
echo "=============================="
echo "=        Menu Program        ="
echo "=============================="
echo "1. Alat Tulis Menulis"
echo "2. Perlengkapan Sekolah"
echo "3. Pembayaran"
echo "4. exit program"
echo "=============================="
echo -n "Pilih menu: "
read pilih
case $pilih in
	1 )
	clear
	atm
		;;
	2 )
	clear
	sekolah
		;;
	3 )
	clear
	let seluruh=$total1+$total2
	echo "Jumlah yang harus dibayar adalah Rp.$seluruh"
	echo -n "Masukkan uang pembeli: "
	read uang
	let kembali=$uang-$seluruh
	echo "Kembaliannya Rp.$kembali"
	read
		;;
	4 )
	echo "Terima Kasih"
	break
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
	sudo deluser --remove-home $hapususer
}
while [[ pilih=1 ]]; do
	clear
	echo "================================================"
	echo "=                 Menu program                 ="
	echo "================================================"
	echo "1. Membuat user baru"
	echo "2. Masuk ke user lain"
	echo "3. Hapus user"
	echo "4. JANGAN DIPILIH. NANTI DEADLOCK LOHHH"
	echo "5. Menginstall aplikasi"
	echo "6. Membuka aplikasi"
	echo "7. Melihat folder dan file dalam computer"
	echo "8. exit program"
	echo "================================================"
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
echo "================================================"
echo "=                 Menu Program                 ="
echo "================================================"
echo "1. Program Stationery Sederhana"
echo "2. Program penerapan sistem operasi"
echo "3. exit program"
echo "================================================"
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
