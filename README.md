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
Location on GitHub: foldera PCA and Admixture

Use the R script PCA.R to reproduce PCA plots.
The script admixture_Dom.sh was used to convert the vcf file into a plink format and run the admixture analysis.
The script make_qmap_pong.sh was used to visualise admixture results with pong.


