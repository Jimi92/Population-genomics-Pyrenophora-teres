#Iran
for i in $(seq 1 5)
do
shuf -n 7 Iran.txt > tmpI
shuf -n 7 Azerbaijan.txt > tmpA
paste tmpI tmpA | tr "\t" "-" | tr "\n" "," > Iran/Ir_Az_comp${i}.txt
shuf -n 7 France.txt > tmpF
paste tmpI tmpF | tr "\t" "-" | tr "\n" "," > Iran/Ir_Fr_comp${i}.txt
shuf -n 7 Morocco.txt > tmpM
paste tmpI tmpM | tr "\t" "-" | tr "\n" "," > Iran/Ir_Mo_comp${i}.txt
shuf -n 7 ND.txt > tmpN
paste tmpI tmpN | tr "\t" "-" | tr "\n" "," > Iran/Ir_ND_comp${i}.txt
done

#Azerbaijan

for i in $(seq 1 5)
do
shuf -n 7 Azerbaijan.txt > tmpI
shuf -n 7 Iran.txt > tmpA
paste tmpI tmpA | tr "\t" "-" | tr "\n" "," > Azerbaijan/Az_Ir_comp${i}.txt
shuf -n 7 France.txt > tmpF
paste tmpI tmpF | tr "\t" "-" | tr "\n" "," > Azerbaijan/Az_Fr_comp${i}.txt
shuf -n 7 Morocco.txt > tmpM
paste tmpI tmpM | tr "\t" "-" | tr "\n" "," > Azerbaijan/Az_Mo_comp${i}.txt
shuf -n 7 ND.txt > tmpN
paste tmpI tmpN | tr "\t" "-" | tr "\n" "," > Azerbaijan/Az_ND_comp${i}.txt
done


#France

for i in $(seq 1 5)
do
shuf -n 7 France.txt > tmpI
shuf -n 7 Azerbaijan.txt > tmpA
paste tmpI tmpA | tr "\t" "-" | tr "\n" "," > France/Fr_Az_comp${i}.txt
shuf -n 7 Iran.txt > tmpF
paste tmpI tmpF | tr "\t" "-" | tr "\n" "," > France/Fr_Ir_comp${i}.txt
shuf -n 7 Morocco.txt > tmpM
paste tmpI tmpM | tr "\t" "-" | tr "\n" "," > France/Fr_Mo_comp${i}.txt
shuf -n 7 ND.txt > tmpN
paste tmpI tmpN | tr "\t" "-" | tr "\n" "," > France/Fr_ND_comp${i}.txt
done

#Morocco

for i in $(seq 1 5)
do
shuf -n 7 Morocco.txt > tmpI
shuf -n 7 Azerbaijan.txt > tmpA
paste tmpI tmpA | tr "\t" "-" | tr "\n" "," > Morocco/Mo_Az_comp${i}.txt
shuf -n 7 Iran.txt > tmpF
paste tmpI tmpF | tr "\t" "-" | tr "\n" "," > Morocco/Mo_Ir_comp${i}.txt
shuf -n 7 France.txt > tmpM
paste tmpI tmpM | tr "\t" "-" | tr "\n" "," > Morocco/Mo_Fr_comp${i}.txt
shuf -n 7 ND.txt > tmpN
paste tmpI tmpN | tr "\t" "-" | tr "\n" "," > Morocco/Mo_ND_comp${i}.txt
done


#Morocco

for i in $(seq 1 5)
do
shuf -n 7 ND.txt > tmpI
shuf -n 7 Azerbaijan.txt > tmpA
paste tmpI tmpA | tr "\t" "-" | tr "\n" "," > ND/ND_Az_comp${i}.txt
shuf -n 7 Iran.txt > tmpF
paste tmpI tmpF | tr "\t" "-" | tr "\n" "," > ND/ND_Ir_comp${i}.txt
shuf -n 7 France.txt > tmpM
paste tmpI tmpM | tr "\t" "-" | tr "\n" "," > ND/ND_Fr_comp${i}.txt
shuf -n 7 Morocco.txt > tmpN
paste tmpI tmpN | tr "\t" "-" | tr "\n" "," > ND/ND_Mo_comp${i}.txt
done



