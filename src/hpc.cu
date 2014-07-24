#include <mpi.h>
#include <rica.cuh>
#include <unistd.h>

int main(){
    int rank;
    int size;
    char hostname[100];

    MPI_Init( 0, 0 );
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    gethostname(hostname, 100);
    printf( "Hello world from process %d %s of %d\n", rank, hostname, size );
    MPI_Finalize();
    return 0;
}
