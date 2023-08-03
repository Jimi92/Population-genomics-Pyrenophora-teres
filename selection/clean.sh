#for each bed file
#for each in *.bed
#do
#for i in {1..12}
#do
#grep "chr${i}	" ${each} | sort -k 2 -n >> ${each%.bed}_ordered.bed
#bedtools merge -i ${each%.bed}_ordered.bed > ${each%.bed}_ordered_merged.bed
#done
#done





for each in *.bed
do
for i in {1..12}
do
grep "chr${i}	" ${each} | sort -k 2 -n >> ${each%.bed}_ordered.bed
bedtools merge -i ${each%.bed}_ordered.bed > ${each%.bed}_ordered_merged.bed
done
done
