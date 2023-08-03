#make script for Ne per population
#for i in *.list; do echo "./msmc2 -t 4 -I" | tr "\n" " " >> ${i%.list}_msmc2.sh
#cat ${i} | sed "s/\n/,/g" - | tr "\n" " " >> ${i%.list}_msmc2.sh
#echo "\\" >> ${i%.list}_msmc2.sh
#echo "-o ${i%.list}.msmc \\" >> ${i%.list}_msmc2.sh
#echo "chr_1.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr2.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr3.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr4.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr5.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr6.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr7.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr8.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr9.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr10.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr11.msmc.input \\" >> ${i%.list}_msmc2.sh
#echo "chr12.msmc.input \\" >> ${i%.list}_msmc2.sh; done



#make compination scripts
#for x in $(seq 1 5)
#do
#for i in *.list
#do
#for y in *.list
#do
#shuf -n 8 ${i} > tmp_i
#shuf -n 8 ${y} > tmp_y
#while read z; do while read o; do echo $z | tr "\n" "-" >> ${i%.list}_${y%.list}_iter_${x}comps; echo ${o} | tr "\n" "," >> ${i%.list}_${y%.list}_iter_${x}comps; done < tmp_i ; done < tmp_y
#done
#done
#done

for i in *comps_msmc2.sh; do > ${i}; done
for i in *comps
do
echo "./msmc2 -t 4 -I" | tr "\n" " " >> ${i}_msmc2.sh
cat ${i} | cut -c 2- | tr "\n" " " >> ${i}_msmc2.sh
echo "\\" >> ${i}_msmc2.sh
echo "-o ${i}.msmc \\" >> ${i}_msmc2.sh
echo "chr_1.msmc.input \\" >> ${i}_msmc2.sh
echo "chr2.msmc.input \\" >> ${i}_msmc2.sh
echo "chr3.msmc.input \\" >> ${i}_msmc2.sh
echo "chr4.msmc.input \\" >> ${i}_msmc2.sh
echo "chr5.msmc.input \\" >> ${i}_msmc2.sh
echo "chr6.msmc.input \\" >> ${i}_msmc2.sh
echo "chr7.msmc.input \\" >> ${i}_msmc2.sh
echo "chr8.msmc.input \\" >> ${i}_msmc2.sh
echo "chr9.msmc.input \\" >> ${i}_msmc2.sh
echo "chr10.msmc.input \\" >> ${i}_msmc2.sh
echo "chr11.msmc.input \\" >> ${i}_msmc2.sh
echo "chr12.msmc.input \\" >> ${i}_msmc2.sh
sed -i "s/, / /" ${i}_msmc2.sh
done
