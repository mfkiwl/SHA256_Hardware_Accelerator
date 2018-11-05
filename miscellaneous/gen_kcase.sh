#!/bin/bash

OP_FILE="kcase_cpy.txt"
END_ADDR=16
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "\t    6'd%u: begin\n" "$LP_IND" >> $OP_FILE
	printf "\t\t    next_data = m1_data[%u:%u];\n" "$(( LP_IND * 32 + 31 ))" "$(( LP_IND * 32 ))" >> $OP_FILE
	printf "\t    end\n\n" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
