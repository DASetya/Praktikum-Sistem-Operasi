index_nama=0
index_npm=0
index_jurusan=0
index_semester=0
index_mk1=0
index_mk2=0
index_mk3=0

declare -a nilai
declare -a mk1
declare -a mk2
declare -a mk3
declare -a ip
declare -a npm
declare -a nama
declare -a jurusan
declare -a semester

identitas(){
	echo "Masukkan Nama : "
	read nama[$index_nama]
	let index_nama=$index_nama+1
	echo "Masukkan Npm : "
	read npm[$index_npm]
	let index_npm=$index_npm+1
	echo "Masukkan Jurusan : "
	read jurusan[$index_jurusan]
	let index_jurusan=$index_jurusan+1
	echo "Masukkan Semester : "
	read semester[$index_semester]
	let index_semester=$index_semester+1
}

nilai(){

	echo "Nilai SisOp : "
	read mk1[$index_mk1]
	let index_mk1=$index_mk1+1
		
	echo "Nilai PemLan : "
	read mk2[$index_mk2]
	let index_mk2=$index_mk2+1

	echo "Nilai BelNeg : "
	read mk3[$index_mk3]
	let index_mk3=$index_mk3+1

}

while [[ pilih=1 ]];do
echo "Menu Program: "
echo "1. Masukkan data mahasiswa"
echo "2. Masukkan data nilai mata kuliah mahasiswa"
echo "3. View data mahasiswa dan nilai mata kuliah mahasiswa"
echo "4. Nilai Indeks Prestasi tiap Mahasiswa (Nilai Jumlah Matkul/Banyak Matkul)"
echo "5. Exit"
echo -n "Pilih menu: "
read pilih

case $pilih in
	1 )
	identitas
		;;
	2 )
	nilai
		;;
	3 )
	for (( i = 0; i < $index_nama; i++ )); do
		echo "Nama     : ${nama[$i]}"
		echo "NPM      : ${npm[$i]}"
		echo "Jurusan  : ${jurusan[$i]}"
		echo "Semester : ${semester[$i]}"
		echo "Nilai SisOp   : ${mk1[$i]}"
		echo "Nilai PemLan  : ${mk2[$i]}"
		echo "Nilai BelNeg  : ${mk3[$i]}"
	done
		;;
	4 )
	IP=0
	jumlah=0
	for (( i = 0; i < $index_nama; i++ )); do
		if [[ $index_mk1 -eq 0 ]]; then
			echo "data invalid"
		else
			let jumlah=${mk1[$i]}+${mk2[$i]}+${mk3[$i]}
			let IP=jumlah/3
			
			echo "Nama     : ${nama[$i]}"
			echo "NPM      : ${npm[$i]}"
			echo "Jurusan  : ${jurusan[$i]}"
			echo "Semester : ${semester[$i]}"
			echo "IP       : $IP"
		fi
			
	done
		;;
	5 )
	echo "Terima Kasih"
	exit
esac
done