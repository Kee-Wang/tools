#!/bin/bash
         COUNTER=1
         until [  $COUNTER -gt 20 ]; do
             mkdir $COUNTER
             cp co2h2o.inp ./$COUNTER
		cp -r coef ./$COUNTER
		cp dmc.x ./$COUNTER
		cp que.dmc ./$COUNTER
		cd ./$COUNTER
		qsub que.dmc
		cd ../
             let COUNTER+=1
         done
