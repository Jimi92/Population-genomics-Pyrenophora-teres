for i in *ms.out
do
echo ${i}
/home/taliadoros/software/sweed-master/SweeD -name sweeD_${i} -input ${i} -length 1000000 -ploidy 1 -grid 600
done
