for i in $(seq 2 5)
do
cd C${i}
echo Im in c${i}
	for x in *Report*
	do
	grep -v "//" ${x} | grep -v "Position" > no_head/${x}
	done
	cd no_head/
		for i in $(seq 1 12);do echo chr${i}; /home/taliadoros/software/raisd-master/RAiSD -n O_R_Chr${i} -CO OmegaPlus_Report.Chr${i}_selection 1 2 RAiSD_Report.France_Chr${i}.out 1 7 -f; done
		for i in $(seq 1 12);do echo chr${i}; /home/taliadoros/software/raisd-master/RAiSD -n S_R_Chr${i} -CO SweeD_Report.Chr${i}selection 1 2 RAiSD_Report.France_Chr${i}.out 1 7 -f; done
		for i in $(seq 1 12);do echo chr${i}; /home/taliadoros/software/raisd-master/RAiSD -n O_S_Chr${i} -CO SweeD_Report.Chr${i}selection 1 2 OmegaPlus_Report.Chr${i}_selection 1 2 -f; done
	cd ..
cd ..
done













# C${i}/no_head/get_coord
