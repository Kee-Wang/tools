#!/bin/bash
for x in *.txt
do
  base=${x%.txt}
  ./2_xopt.x $x 0
  mv $base.opt $base.log ./$dir1
  ./2_xopt.x $x 1
  mv $base.opt $base.log ./$dir2
  ./2_xopt.x $x 2
  mv $base.opt $base.log ./$dir3
  mv $x $dir4
done
