# Population-genomics-Pyrenophora-teres
This repository hosts scripts for the genomic analysis of natural populations of pyrenophora teres, associated with this work: https://www.biorxiv.org/content/10.1101/2023.07.28.550921v1.full

------------------------------------------------------------------------------------------------------------------------------------

# Data preparation

## SNP calling and filtering

Location on GitHub: folder SNP_calling

The script full_pipe_SNP_calling.sh was used to 1) trim raw sequence files, 2) map the sequences on the reference genome, and 3) call and hardfilter high-quality SNPs and indels.
The script fetch_independ_neutral.sh was used to create the independent and neutral datasets as discribed here: https://www.biorxiv.org/content/10.1101/2023.07.28.550921v1.full

## De novo assemblies
Location on GitHub: folder assemblies

The script assemble.sh was used to optain de novo assemblies using the software Spades.

## Phylogenetics
Location on GitHub: folder phylogenetics

Gene sequences were obtained from NCBI. The script concat.sh was used to concatenate the sequences.
scripts ML_IQtree.sh and MP.sh were used for the creation of the phylogenetic trees

----------------------------------------------------------------------------------------------------------------------------------------

# Data analyses

## PCA and Admixture
Location on GitHub: folders PCA and Admixture

Use the R script PCA.R to reproduce PCA plots.
The script admixture_Dom.sh was used to convert the vcf file into a plink format and run the admixture analysis.
The script make_qmap_pong.sh was used to visualise admixture results with pong.

## Nucleotide diversity and Tajima's D
Location on GitHub: folder Genetic_diversity_est

Use the script gen_div_td.sh to obtain estimates for Nucleotide diversity and Tajima's D. The tsd.Rmd script visualizes the results and runs the Kruskal-Wallis and Wilcoxon tests.

## PoMo
Location on GitHub: folder PoMo

the script FastaVCFToCounts.py was used to convert the VCF file to a cf file. Then the run_PoMo.sh was used to run the analysis

## MSMC2
Location on GitHub: folder MSMC2

MSMC2 analysis was ran using all the run_msmc_x.sh scripts, were x is a number. The different scripts contain different combinations of Ptt populations. 

## Selection
Location on GitHub: folders raisd and selection

Scripts raisd/RaisD_new.sh, selection/Omega_pus.sh, and selection/sweeD.sh was used to run the software RaisD, OmegaPlus, and SweeD, respectively. 

## Circos
Location on GitHub: folder Circos

All files needed to re-create circos figure can be found in the folder Circos.
