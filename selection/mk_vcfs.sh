for i in *.txt;
do
vcftools --gzvcf Domesticated_only_No-miss_Biall_snips.vcf --keep ${i} --mac 1 --max-missing 1 --recode --out ${i%.txt}
bgzip ${i%.txt}.recode.vcf
tabix ${i%.txt}.recode.vcf.gz
done

for i in *.vcf.gz
do
for x in $(seq 1 12)
do
mkdir ${i%.recode.vcf.gz}
vcftools --gzvcf ${i} --chr chr${x} --mac 1 --max-missing 1 --recode --out ${i%.recode.vcf.gz}/${i%.recode.vcf.gz}_chr${x}
done
done
