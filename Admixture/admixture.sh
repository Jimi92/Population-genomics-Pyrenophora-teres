#/home/taliadoros/software/plink_linux_x86_64_20200616/plink --vcf ~/Desktop/phd_projects/Ptt/New_full/Admixture/Ptt_filtered_thin_0.3kb.recode.vcf --id-delim - --maf 0.05 --recode 12 --out ~/Desktop/phd_projects/Ptt/New_full/Admixture/plink --chr-set 86 --allow-extra-chr



#for K in 1 2 3 4 5 6; \
#do /home/taliadoros/software/admixture_linux-1.3.0/admixture --cv /home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.ped $K --haploid="*" | tee log${K}.out
#done

#ord2 = tbl2[order(tbl2$V1,tbl2$V2,tbl2$V3),]
#> View(ord2)
#> barplot(t(as.matrix(ord2)), col=rainbow(7), xlab="Sampling site", ylab="Ancestry", border=NA,
#+         names.arg=barNaming(ordered(ord2$site)), las=3)

#for K in 1 2 3 4 5 6 7 8 9 10; \
#do /home/taliadoros/software/admixture_linux-1.3.0/admixture --cv /home/taliadoros/Desktop/phd_projects/Ptt/VCF/ortho_miss/Admixture/plink.ped $K --haploid="*" | tee log${K}.out
#done








prefix=plink
for r in $(seq 1 10)
do 
for K in $(seq 2 10)
do /home/taliadoros/software/admixture_linux-1.3.0/admixture -s time /home/taliadoros/Desktop/phd_projects/Ptt/New_full/Admixture/plink.ped $K
echo procesed ${prefix}.K${K}r${r}.Q
mv ${prefix}.${K}.Q ${prefix}.K${K}r${r}.Q
mv ${prefix}.K${K}r${r}.Q out/
done
done
