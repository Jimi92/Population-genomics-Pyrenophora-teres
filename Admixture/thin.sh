INPUT_DIR=~/Desktop/phd_projects/Ptt/New_full/
VCF=Ptt_filtered.vcf
OUTPUT_DIR=./

cd ${INPUT_DIR}
vcftools --vcf ${VCF} --thin 300 --recode --recode-INFO-all --out ${VCF%.vcf}_thin_0.3kb
