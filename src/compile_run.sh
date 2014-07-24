#/bin/sh

make clean
make
mpirun_rsh -np 4 -hostfile hostfile ./hpc
