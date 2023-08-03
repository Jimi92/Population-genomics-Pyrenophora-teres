#/home/taliadoros/software/omegaplus-master/OmegaPlus -name Chr1_selection -input /home/taliadoros/Desktop/phd_projects/Cb/selection_fungicide_resistance/fastsimcoal26/short_DNA_regs/chosen/sfs/model_choice/new_test/new/MS/new_mutation_rate.out -length 2967425 -grid 8767 -minwin 2500 -maxwin 100000 -seed 417790
for i in *ms.out
do
/home/taliadoros/software/omegaplus-master/OmegaPlus -name Omega_selection_2 -input ${i} -length 1000000 -grid 300 -minwin 4000 -maxwin 10000 -seed 417791
done
