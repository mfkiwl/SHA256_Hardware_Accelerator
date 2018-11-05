#!/bin/bash

OP_FILE="kport_cpy.txt"
END_ADDR=0
LP_IND=63

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "k_reg_data[%u]," "$LP_IND" >> $OP_FILE
	LP_IND=$(( LP_IND - 1 ))
done

printf "k_reg_data[%u]" "$LP_IND" >> $OP_FILE

