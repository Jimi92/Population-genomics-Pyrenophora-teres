#!/bin/bash
#
#  submit by  sbatch full_pipe_until_prinseq.sh
#
#  specify the job name
#SBATCH --job-name=SNP_calling
#  how many cpus are requested
#SBATCH --ntasks=4
#  run on one node, importand if you have more than 1 ntasks
#SBATCH --nodes=1
#  maximum walltime, here 10min
#SBATCH --time=96:00:00
#  maximum requested memory
#SBATCH --mem=100G
#  write std out and std error to these files
#SBATCH --error=NC.%J.err
#SBATCH --output=NC.%J.out
#  send a mail for job start, end, fail, etc.
#  which partition?
#  there are global,testing,highmem,standard,fast
#SBATCH --partition=global

#  add your code here:
###############################################################################################################################################################################################
## Developed by Demetris taliadoros: last update 5/2/2020                                                                                                                                    ##
## USE THIS PIPELINE TO: 1) TRIM SEQUENCING ADDAPTERS, MERGE READ OVERLAP, AND REMOVE PCR DUPS.                                                                                              ##
###############################################################################################################################################################################################

#path from working directory to directory that you wish the job to be done
path=/home/taliadoros/1_Cercospora/0_Raw/

#path to software
soft=/data/biosoftware/

# Create necessary directories
#mkdir ${path}trimmed
#mkdir ${path}trimmed/unpaired
#mkdir ${path}trimmed/fastqc
#mkdir ${path}aligned
#mkdir ${path}aligned/stampy
#mkdir ${path}aligned/stampy/insert

################################## Trim for adapters, quality, and length #######################################
## Trim for adapters, quality, and length

Raw_reads=/home/taliadoros/Cercospora/full_genome_set_raw/Genomes/
trimmo=${soft}Trimmomatic/Trimmomatic-0.38/
fastqc=${soft}FastQC/FastQC/
out_dir=${path}trimmed/
fastQCDir=${path}trimmed/fastqc/
unpaired=${path}trimmed/unpaired/

#Trim for adaptors
#raw read directory

#cd ${Raw_reads}

#for each in *_1.fq.gz
#do
#echo ${each}
#java -jar ${trimmo}trimmomatic-0.38.jar PE -threads 5 \
#				$each ${each%_1.fq.gz}_2.fq.gz \
#				${out_dir}${each%1.fq.gz}P_1.fastq ${out_dir}${each%1.fq.gz}U_1.fastq \
#				${out_dir}${each%1.fq.gz}P_2.fastq ${out_dir}${each%_1.fq.gz}U_2.fastq \
#				ILLUMINACLIP:${trimmo}adapters/TruSeq3-PE-2.fa:2:30:10 SLIDINGWINDOW:3:28 MINLEN:30
#done

#FastQC

#cd ${out_dir}
#for each in *fastq
#do
#${fastqc}fastqc ${each} --outdir ${fastQCDir}
#done

#mv *U_1.fastq ${unpaired}
#mv *U_2.fastq ${unpaired}

############################################################################
########################## Merge reads with PEAR ###########################
############################################################################

#mkdir ${path}PEAR
#mkdir ${path}PEAR/fastqc_pear
#mkdir ${path}PEAR/assembled
#mkdir ${path}PEAR/unassembled
#mkdir ${path}PEAR/fastqc_pear

trimmed=${path}trimmed/
fastqc_outdir=${path}PEAR/fastqc_pear/
assembled=${path}PEAR/assembled/
unassembled=${path}PEAR/unassembled/
pear=${soft}pear/pear-0.9.10-bin-64/
fastqc=${soft}FastQC/FastQC/


#cd ${trimmed}

#for each in *1.fastq
#do
#${pear}pear-0.9.10-bin-64 -f  ${each} -j 4 -r ${each%1.fastq}2.fastq -n 0 -k -o ${each%1.fastq}

#${fastqc} ${each%1.fastq}.assembled.fastq ${each%1.fastq}.unassembled.forward.fastq ${each%1.fastq}.unassembled.reverse.fastq --outdir ${fastqc_outdir}
#done

#mv *assembled.fastq ${assembled}
#mv *unassembled* ${unassembled}


# Merge pear assembled with trimmo U1 
#cp ${unpaired}/* ${assembled}
#FastQC

#cd ${out_dir}
#for each in *fastq
#do
#${fastqc}fastqc ${each} --outdir
#done

#############################################################################################
##################################### Remove PCR dups #######################################
#############################################################################################

pear=${path}PEAR/
unassembled=unassembled/
assembled=assembled/
fastqc_outdir1=unassembled/fastqc/
fastqc_outdir2=assembled/fastqc/
prinseq=prinseq/

#module load perl/5.26.1

#mkdir ${pear}${unassembled}${prinseq}
#mkdir ${pear}${assembled}${prinseq}
#mkdir ${path}dups
#mkdir ${path}dups/${fastqc_outdir1}
#mkdir ${path}dups/${fastqc_outdir2}
#mkdir ${pear}${unassembled}fastqc/
#mkdir ${pear}${assembled}fastqc/

#cd ${pear}${unassembled}
#for each in *forward.fastq
#do
#echo ${each}
#perl /data/biosoftware/prinseq/prinseq-lite-0.20.4/prinseq-lite.pl -fastq ${each} -fastq2 ${each%forward.fastq}reverse.fastq -log -verbose -derep 14 -out_format 3 \
#-out_good ${pear}${unassembled}${prinseq}${each%forward.fastq}

#${soft}FastQC/FastQC/fastqc ${each%forward.fastq}_* --outdir ${pear}${fastqc_outdir1}

#done

#cd ${pear}${assembled}

#for each in *.fastq
#do
#echo ${each}
#perl /data/biosoftware/prinseq/prinseq-lite-0.20.4/prinseq-lite.pl -fastq ${each} -log -verbose -derep 14 -out_format 3 -out_good ${pear}${assembled}${prinseq}${each%.fastq}1

#${soft}FastQC/FastQC/fastqc ${each%assembled.fastq}1* --outdir ${pear}${fastqc_outdir2}

#done

#merge=merge/

#mkdir ${pear}${assembled}${prinseq}${merge}

#cd ${pear}${assembled}${prinseq}

#for each in *P_.assembled1.fastq
#do
#echo ${each}
#cat ${each%P_.assembled1.fastq}*.fastq > ${pear}${assembled}${prinseq}${merge}${each%P_.assembled1.fastq}assembled_merged.fastq
#done

####################################################################
######################## ALIGNMENT #################################
####################################################################

############################### BWA ################################

bwaDir=${path}aligned
ref=/home/taliadoros/Cercospora/raw_mat/old/aligned/ref/NCBI_Reference.fasta
bwa_soft=/data/biosoftware/bwa/bwa-0.7.15/


#cd ${pear}${assembled}${prinseq}${merge}

#${bwa_soft}bwa index ${ref}

#for each in *.fastq
#do
#echo ${each}
#${bwa_soft}bwa mem -M -t 4 ${ref} ${each} > ${path}aligned/${each%.fastq}.sam

#done

#cd ${pear}${unassembled}${prinseq}

#${bwa_soft}bwa index ${ref}

#for each in *_1.fastq
#do
#${bwa_soft}bwa mem -M -t 4 ${ref} ${each} ${each%1.fastq}2.fastq > ${path}aligned/${each%_1.fastq}.sam

#done


## stampy
##################################### make BAM ##################################

#echo "making bams"

samtools_soft=${soft}samtools/samtools-1.9/
Ref=/home/taliadoros/Cercospora/raw_mat/old/aligned/ref/NCBI_Reference.fasta
flag_out=${path}aligned/flag/

#mkdir ${flag_out}

#module load python/2.7.13

#cd ${path}aligned/

#make BAM
#for each in *.sam
#do
#echo ${each}
#${samtools_soft}samtools view -S -b ${each} > ${each%sam}bam
#done

#for each in *..bam
#do
#mv ${each} ${each%..bam}.bam
#done
 
################################# stampy ##############################################
#stampy assembled

#${stampy_soft}stampy.py -G ptg ${Ref}

#${stampy_soft}stampy.py -g ptg -H ptg

#for each in *assembled_merged.bam
#do
#echo ${each}
#${stampy_soft}stampy.py -g ptg -h ptg -t4 --bamkeepgoodreads -M ${each} -o ${path}aligned/stampy/${each%.bam}.stampy.sam
#done

#cd ${path}aligned/stampy/
#for each in *assembled_merged.sam
#do
#echo ${each}
#${samtools_soft}samtools flagstat ${each} > ${flag_out}${each}.stats
#done

###############################################################
##################### stampy unassembled ######################
###############################################################
#echo "unassembled alignment starts"

#${stampy_soft}stampy.py -G ptg ${Ref}

#${stampy_soft}stampy.py -g ptg -H ptg

#for each in *.unassembled.bam
#do
#echo ${each}
#${stampy_soft}stampy.py -g ptg -h ptg -t4 --bamkeepgoodreads -M ${each} -o ${path}aligned/stampy/${each%.bam}.stampy.sam
#done

#cd ${path}aligned/stampy/
#for each in *.sam
#do
#echo ${each}
#${samtools_soft}samtools flagstat ${each} > ${flag_out}${each}.stats
#done



############################################################
###################// POST-ALIGNMENT //#####################
############################################################ 

#cd ${path}aligned/

#this script sort reads with respect to their cromosomal position, outputs depth possition, marks PCR artifacts, remove non unic alignments.

Stampy_dir=${path}aligned/
Sorted=${path}aligned/sorted/
Depth_dir=${path}aligned/depth/

#mkdir ${Sorted}
#mkdir ${Depth_dir}

#cd ${Stampy_dir}
#for each in *.bam
#do
#echo ${each}
#samtools sort -o ${Sorted}${each%.bam}.sorted.bam -@ 4 ${each}
#samtools depth -a ${Sorted}${each%.bam}.sorted.bam > ${Depth_dir}${each}.stats
#done



echo "Info for Jim: sort done"
##########################################

# RG
#
#SE_12_141_assembled_merged.sorted.bam
#SE_12_141_assembled_merged.sortedR.bam
#SE_12_141_P_.unassembled.sorted.bam
#SE_12_141_P_.unassembled.sortedR.bam

#mkdir aligned/sorted/RGed/
cd aligned/sorted/

RG_dir=/home/taliadoros/1_Cercospora/0_Raw/aligned/sorted/RGed/

# 1) assembled

#for each in *_assembled_merged.sorted.bam
#do
#echo ${each}
#var=`samtools view ${each} | head -n 1 | cut -f1 | cut -d ":" -f 3,4`
#java -jar /data/biosoftware/Picard/Picard/picard.jar AddOrReplaceReadGroups \
#       I=${each} \
#       O=${RG_dir}${each%bam}read.bam \
#       RGID="$var"\
#       RGLB=lb1 \
#       RGPL=illumina \
#       RGPU=unit1 \
#       RGSM=${each%_assembled_merged.sorted.bam}
#done



# 2) assembledR

#for each in *_assembled_merged.sortedR.bam
#do
#echo ${each}
#var=`samtools view ${each} | head -n 1 | cut -f1 | cut -d ":" -f 3,4`
#java -jar /data/biosoftware/Picard/Picard/picard.jar AddOrReplaceReadGroups \
#       I=${each} \
#       O=${RG_dir}${each%bam}readR.bam \
#       RGID="$var"\
#       RGLB=lb1 \
#       RGPL=illumina \
#       RGPU=unit1 \
#       RGSM=${each%_assembled_merged.sortedR.bam}
#done




# 3) unassembled

#for each in *_P_.unassembled.sorted.bam
#do
#echo ${each}
#var=`samtools view ${each} | head -n 1 | cut -f1 | cut -d ":" -f 3,4`
#java -jar /data/biosoftware/Picard/Picard/picard.jar AddOrReplaceReadGroups \
#       I=${each} \
#       O=${RG_dir}${each%bam}read.bam \
#       RGID="$var"\
#       RGLB=lb2 \
#       RGPL=illumina \
#       RGPU=unit1 \
#       RGSM=${each%_P_.unassembled.sorted.bam}
#done





# 4) unassembledR

#for each in *_P_.unassembled.sortedR.bam
#do
#echo ${each}
#var=`samtools view ${each} | head -n 1 | cut -f1 | cut -d ":" -f 3,4`
#java -jar /data/biosoftware/Picard/Picard/picard.jar AddOrReplaceReadGroups \
#       I=${each} \
#       O=${RG_dir}${each%bam}readR.bam \
#       RGID="$var"\
#       RGLB=lb2 \
#       RGPL=illumina \
#       RGPU=unit1 \
#       RGSM=${each%_P_.unassembled.sortedR.bam}
#done


echo "Info for Jim: RG done"
#################################################################################
#merge

sorted_dir=${path}aligned/sorted/RGed/

#mkdir ${sorted_dir}merged/

cd ${sorted_dir}
for each in *_assembled_merged.sorted.read.bam
do
echo ${each}
samtools merge ${sorted_dir}merged/${each%_assembled_merged.sorted.read.bam}_merged.bam \
${each%_assembled_merged.sorted.read.bam}_*
done


#merge SE

#SE_sorted_dir=${path}aligned/sorted/RGed/SE/


#cd ${SE_sorted_dir}
#for each in *_assembled_merged.sorted.read.bam
#do
#echo ${each}
#samtools merge ${sorted_dir}merged/${each%_assembled_merged.sorted.read.bam}_merged.bam \
#${each} ${each%_assembled_merged.sorted.read.bam}_P_.unassembled.sorted.read.bam ${each%_assembled_merged.sorted.read.bam}_assembled_merged.sortedR.read.bam ${each%_assembled_merged.sorted.read.bam}_P_.unassembled.sortedR.readR.bam
#done


#cd ${SE_sorted_dir}
#while read each
#do
#echo ${each}
#samtools merge ${sorted_dir}merged/${each%_assembled_merged.sorted.read.bam}_merged.bam \
#${each} ${each%_assembled_merged.sorted.read.bam}_P_.unassembled.sorted.read.bam
#done < list_of_good.txt


echo "Info for Jim: merge done"
###############################################

#index

cd ${sorted_dir}merged/
for each in *bam
do
echo ${each}
samtools index ${each}
done

echo "Info for Jim: Indexing done"

