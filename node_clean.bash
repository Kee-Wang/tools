#!/bin/bash
for n in {2..25}
do
rsh node$n rm -r /scratch/kee/*
done
