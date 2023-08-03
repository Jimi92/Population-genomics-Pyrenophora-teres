cd /home/taliadoros/software/raisd-master
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/gsl/lib
cd ~/Desktop/phd_projects/Ptt/2022/msmc2/all_chr/MS/RAiseD
for i in *.out
do
/home/taliadoros/software/raisd-master/RAiSD -I ${i} -n RaisD_selection_${i} -f -L 1000000
done
