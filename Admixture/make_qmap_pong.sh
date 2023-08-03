prefix=plink
createQmap(){
local r=$1
local K=$2
awk -v K=$K -v r=$r -v file=${prefix}.K${K}r${r} 'BEGIN{ \
printf("K%dr%d\t%d\t%s.Q\n",K,r,K,file)
}' >> ${prefix}.multiplerun.Qfilemap
}

export -f createQmap
for K in $(seq 2 10); do for r in $(seq 1 10); do createQmap $r $K; done; done

#run pong

#pong -m plink.multiplerun.Qfilemap --greedy -s.95 -i Pyro.ind2pop
