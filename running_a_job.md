# Running A Job

This section explains how to run a job by showing an example from making
a mpi program to executing it on SLURM compute nodes.

### Write your first mpi program "Hello World!"

First of all, create your work directory:

```bash
mkdir ~/mpi_hello
cd ~/mpi_hello
```

Then, open a new file called `mpi_hello_world.c`, and edit it like this:

```c
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    // Initialize the MPI environment
    MPI_Init(NULL, NULL);

    // Get the number of processes
    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // Get the rank of the process
    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    // Get the name of the processor
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;
    MPI_Get_processor_name(processor_name, &name_len);

    // Print off a hello world message
    printf("Hello world from processor %s, rank %d"
           " out of %d processors\n",
           processor_name, world_rank, world_size);

    // Finalize the MPI environment.
    MPI_Finalize();
}
```

### Write your job script
Open a new file called `mpi_hello.script`, and edit it like this:

```sh
#!/bin/sh
#SBATCH -J MPI_HELLO
#SBATCH -o MPI_HELLO.%J.stdout
#SBATCH -e MPI_HELLO.%J.stderr
#SBATCH -p development
#SBATCH -N 2
#SBATCH -t 00:10:00

module load openmpi
cd $HOME/mpi_hello
mpicc mpi_hello_world.c -o mpi_hello_world
mpirun -n 48 ./mpi_hello_world
```

The follows are the brief explanations about the job script.

- `#SBATCH -J MPI_HELLO` --> Set up the name of the job as `MPI_HELLO`.
- `#SBATCH -o MPI_HELLO.%J.stdout` --> Output standard output to the file
  `MPI_HELLO.%J.stdout`. `%J` is job ID.
- `#SBATCH -e MPI_HELLO.%J.stderr` --> Output standard error to the file
  `MPI_HELLO.%J.stderr`.
- `#SBATCH -p development` --> Use `development` partition. The idea of SLURM's partition
  is the same as PBS's queue.
- `#SBATCH -N 2` --> Use 2 nodes.
- `#SBATCH -t 00:10:00` --> Walltime is 10 minutes.
- `module load openmpi` --> Load OpenMPI.
- `cd $HOME/mpi_hello` --> Change directory to `$HOME/mpi_hello`.
- `mpicc mpi_hello_world.c -o mpi_hello_world` --> Compile `mpi_hello_world.c` and save
  the binary file as `mpi_hello_world`.
- `mpirun -n 48 ./mpi_hello_world` - Eexecute it with 48 cores. Each node has 24 cores,
  so the total becomes 48.

**NOTE:** If you'd like to receive email notification, add the following lines
on the script.

```
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=<your_email_address>
```

### Run your first job

Running a job is like this:

```bash
sbatch mpi_hello.script
```

You can check your job status with:

```bash
squeue
```

Once your job is done, there should be two files created, `MPI_HELLO.<job id>.stdout` and
`MPI_HELLO.<job id>.stderr`, so take a look at the files like this:

```bash
less MPI_HELLO.<job id>.stdout
less MPI_HELLO.<job id>.stderr
```

To exit the viewer, you need to hit the `q` key.

If everything's done correctly, you should find 48 lines of "Hello world from processor
[node name], rank [number] out of 48 processors" on `MPI_HELLO.<job id>.stdout`,
and nothing's on `MPI_HELLO.<job id>.stderr` file.
