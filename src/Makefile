CC=g++
MPICC=mpicc
NVCC=nvcc
NVCCFLAGS:=-G -g -w -gencode arch=compute_20,code=\"sm_20,compute_20\" -I.
LDFLAGS=-L/usr/local/cuda/lib -L/usr/local/cuda/lib64
OBJS=hpc.o rica.o

hpc : $(OBJS)
	$(MPICC) $(LDFLAGS) $^ -lcudart -o $@

%.o : %.cu
	$(NVCC) -c $(NVCCFLAGS) $< -o $@

clean:
	rm -rf *.o hpc
