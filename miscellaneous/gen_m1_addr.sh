#!/bin/bash

OP_FILE="cpy_paste.txt"
END_ADDR=16
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "\tm1_mem_%u <= pad_mem[%u:%u];\n" "$LP_IND" "$(( ( 15 - LP_IND ) * 32 + 31 ))" "$(( ( 15 - LP_IND ) * 32 ))" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
