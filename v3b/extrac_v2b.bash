#!/bin/bash
#Extract unique v2b from clathrate
#First 1,2 v2b has be added manually
for x in v3b000{01..19}.out
do
./get_v2b.py $x
#/home/kee/github/tools/v3b/get_v2b.py $x
done


filename1='allv2b.xyz'
filename2='allv2b.xyz'
rm $filename1
rm $filename2
for x in *v2b.xyz
do
cat $x >> $filename1
rm $x 
done

for x in *v2b.err
do
cat $x >> $filename2
rm $x
done
