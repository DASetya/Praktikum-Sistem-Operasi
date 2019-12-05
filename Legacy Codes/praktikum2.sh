echo -n "Masukkan satuan waktu menit: "
read menit

if [[ $menit -ge 1440 ]]; then
    let hari=$menit/1440
    let menit=$menit-$hari*1440
    echo "$hari hari"
fi

if [[ $menit -ge 60 ]]; then
    let jam=$menit/60
    let menit=$menit-$jam*60
    echo "$jam jam"
fi

echo "$menit menit"
