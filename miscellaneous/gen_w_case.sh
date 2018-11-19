#!/bin/bash

OP_FILE="wcase_cpy.txt"
END_ADDR=64
LP_IND=0

printf "" > $OP_FILE

while [ $LP_IND -ne $END_ADDR ]
do
	printf "\t    6'd%u: begin\n" "$LP_IND" >> $OP_FILE
	printf "\t\t  w_regf[$LP_IND] = final_add_res;\n" "$LP_IND" >> $OP_FILE
	printf "\t    end\n\n" >> $OP_FILE
	LP_IND=$(( LP_IND + 1 ))
done
