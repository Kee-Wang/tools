#!/bin/bash
for x in *.out
do
/home/kee/github/tools/v3b/get_v3b.py $x
done


filename1='all.xyz'
filename2='allerr.xyz'
rm $filename1
rm $filename2
for x in v3b*.xyz
do
cat $x >> $filename1
rm $x 
done

for x in *.err
do
cat $x >> $filename2
rm $x
done
