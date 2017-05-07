# To delete fesme '*.xml_*' -delete in current and all subdirectories
find . -name '*.xml*' -delete


# For archive and compress
 tar cvf - ./  --exclude=benhui* --exclude='.[^/]*'  | 7z a -si test.tar.7z
  to backup a directory  : tar cf - directory | 7za a -si directory.tar.7z
  to restore your backup : 7z x -so .7z | tar xf -


# using bash for batch
!/bin/bash
for x in *.txt
do
rm $x
done

# In Make file, for lpes and mod pes, the path cannot be too long
