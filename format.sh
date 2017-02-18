## Modify 'diskN' by the disk you want to format (find it with `fdisk -l` on linux or `diskutil -list` on MacOS ##

for n in `seq 7`; do dd if=/dev/urandom of=/dev/diskN ; done
