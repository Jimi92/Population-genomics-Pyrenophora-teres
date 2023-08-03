for i in Azerbaijan France Iran Morocco ND
do
cd ${i}
for x in *.txt
do
echo "./msmc2 -t 13 -I" | tr "\n" " " > MSMC_runs/${x%.txt}.sh
cat ${x} >> MSMC_runs/${x%.txt}.sh
sed -i "s/,$/ /g" MSMC_runs/${x%.txt}.sh
echo "-o ${x%.txt}_comps.msmc \\" >> MSMC_runs/${x%.txt}.sh
cat ../chromos.txt >> MSMC_runs/${x%.txt}.sh
done
cd ..
done
