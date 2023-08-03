for i in 12
do
cd chr_${i}
for each in *.vcf.gz
do
gunzip ${each}
done
for each in *.vcf;do grep "#" ${each} >> ${each%.vcf}_phased.vcf; grep -v "#" ${each} | sed "s/\//\|/g" >> ${each%.vcf}_phased.vcf; done
for f in *phased.vcf
do
bgzip ${f}
done
cp /home/taliadoros/Desktop/phd_projects/Ptt/New_full/Newest/MSMC2/vcf_from_bam2/pops/ch/generate_multihetsep.py ./
cp/home/taliadoros/Desktop/phd_projects/Ptt/New_full/Newest/MSMC2/vcf_from_bam2/pops/ch/msmc2 ./
> list_of_files.txt
for y in $(ls *.bed.gz) 
do
echo "--mask" | tr "\n" " " >> list_of_files.txt
echo ${y} | tr "\n" " " >> list_of_files.txt
echo "\\" >> list_of_files.txt
done
for x in $(ls *.vcf.gz) 
do
echo ${x} | tr "\n" " " >> list_of_files.txt
echo "\\" >> list_of_files.txt
done
echo "python3 generate_multihetsep.py \\" > generate_multigetsep.sh
cat list_of_files.txt >> generate_multigetsep.sh
echo "--chr=chr${i} > chr${i}.msmc.input" >> generate_multigetsep.sh
sh generate_multigetsep.sh
cd ..
done
