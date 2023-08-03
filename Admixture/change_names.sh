#alternative
for i in *.vcf; do sed -i "s/AZBPtt_/AZBPtt-/g" ${i}; sed -i "s/AZBptt_/AZBptt-/g" ${i}; sed -i "s/Index_/Index-/g" ${i}; sed -i "s/Mor-/Mor_/g" ${i}; sed -i "s/S-/S_/g" ${i}; sed -i "s/SM-/SM_/g" ${i}; done
for i in *.vcf; do sed -i "s/MorCCCA_1merged2.bam/MorCCCA-1merged2.bam/g" ${i}; done
for i in *.vcf; do sed -i "s/M207_Pt97/M207-Pt97/g" ${i}; done
for i in *.vcf; do sed -i "s/Mor_CCS_/Mor-CCS_/g" ${i}; done
for i in *.vcf; do sed -i "s/B_/B-/g" ${i}; done




#original names
#for i in *.vcf
#do
#sed -i "s/AZBPtt-/AZBPtt_/g" ${i}
#sed -i "s/AZBptt-/AZBptt_/g" ${i}
#sed -i "s/Index-/Index_/g" ${i}
#sed -i "s/Mor_/Mor-/g" ${i}
#sed -i "s/S_/S-/g" ${i}
#sed -i "s/SM_/SM-/g" ${i}
#sed -i "s/MorCCCA-1merged2.bam/MorCCCA_1merged2.bam/g" ${i}
#sed -i "s/M207-Pt97/M207_Pt97/g" ${i}
#sed -i "s/Mor-CCS-/Mor-CCS_/g" ${i}
#sed -i "s/B-/B_/g" ${i}
#done


#for i in pops.txt domesticated.list; do sed -i "s/MorCCCA_1merged2.bam/MorCCCA-1merged2.bam/g" ${i}; done
#for i in pops.txt domesticated.list; do sed -i "s/M207_Pt97/M207-Pt97/g" ${i}; done
#for i in pops.txt domesticated.list; do sed -i "s/Mor_CCS_/Mor-CCS_/g" ${i}; done
#for i in pops.txt domesticated.list; do sed -i "s/B_/B-/g" ${i}; done
