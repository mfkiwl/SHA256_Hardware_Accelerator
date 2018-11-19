#!/bin/bash

OP_FILE="wclear_cpy.txt"
END_ADDR=64
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "w_regf[%u] <= 32'b0;\n" "$LP_IND" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
