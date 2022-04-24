#!/bin/bash
echo > "inputFile.txt"
for ((i=0;i<10;i++))
do			
	printf "$i, $RANDOM\n" >> inputFile.txt		
done
