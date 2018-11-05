#!/bin/bash

OP_FILE="gen_cpy_paste.txt"
END_ADDR=64
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "\t\t\t\t6'd%u: begin\n" "$LP_IND" >> $OP_FILE
	printf "\t\t\t\t\tpad_mem[%u:%u] <= data_sel;\n" "$(( ( 63 - LP_IND ) * 8 + 7 ))" "$(( ( 63 - LP_IND ) * 8 ))" >> $OP_FILE
	printf "\t\t\t\tend\n\n" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
