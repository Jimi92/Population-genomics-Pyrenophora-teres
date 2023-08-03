for i in $(seq 1 12)
do
cut -f 1 -d "	" ../../*PointsRAiSD.S_R_Chr${i} | cut -f 1 -d "." > list_sweedO_chr${i}.txt
done

for i in $(seq 1 12)
do
cut -f 1 -d "	" ../../*PointsRAiSD.O_R_Chr${i} | cut -f 1 -d "." > list_sweedR_chr${i}.txt
done

for i in $(seq 1 12)
do
while read p; do echo "chr${i}" | tr "\n" "\t" >> coords_omega.txt
grep ${p} ../../RAiSD_Report.France_Chr${i}.out | cut -f 2,3 >> coords_omega.txt
done < list_sweedO_chr${i}.txt
done

for i in $(seq 1 12)
do
while read p; do echo "chr${i}" | tr "\n" "\t" >> coords_rais.txt
grep ${p} ../../RAiSD_Report.France_Chr${i}.out | cut -f 2,3  >> coords_rais.txt
done < list_sweedR_chr${i}.txt
done
