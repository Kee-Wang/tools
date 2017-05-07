#!/usr/bin/env python
import sys
#file = input('Input filename: ')
file = sys.argv[1]
#file = 'mp.out'
filetrim = file.split('.')[0]
outfile = filetrim + '.xyz'
errfile = filetrim + '.err'
f = open(file)
natm = 9
count = 0
line1 = 30
line2 = 39
config = list()
for line in f:
    count = count + 1
    newline = line.split()
    if len(newline)<1:
        continue
    for i in range(line1,line2):
        if count == i:
            config.append(line)
    if newline[0] == 'V3B':
        e = float(newline[2])
try:
    out = open(outfile,'w')
    out.write( """{:<2d}
{:<14.8f}
"""
.format(natm,e) )
    for line in config:
        out.write(str(line))
    print('File: {} with energy: {:<14.8f}'.format(file,e))
except:
    out = open(errfile,'w')
    out.write( """{:<2d}
{:<14.8f}
"""
.format(natm,0.0) )
    for line in config:
        out.write(str(line))
    print('Wrong E in file: {}'.format(file))

out.close()
