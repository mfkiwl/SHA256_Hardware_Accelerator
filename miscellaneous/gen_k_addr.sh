#!/bin/bash

OP_FILE="addr_k_cpy.txt"
END_ADDR=64
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "\tw_reg[%u] <= 0;\n" "$LP_IND" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
