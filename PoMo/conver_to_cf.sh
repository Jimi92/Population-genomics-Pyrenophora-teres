for i in *.gz
do
./FastaVCFToCounts.py /home/taliadoros/Desktop/phd_projects/Ptt/treemix/Reference/0-1_assembly.v14.norm.fa ${i} -m -p 1 ${i%recode.vcf.gz}cf
done
