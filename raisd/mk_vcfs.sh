for i in *.vcf.gz
do
for x in $(seq 1 12)
do
vcftools --gzvcf ${i} --chr chr${x} --mac 1 --recode --out ${i%.recode.vcf.gz}/${i%.recode.vcf.gz}_chr${x}
done
done
