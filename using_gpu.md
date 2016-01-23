Using GPU/CUDA
==============

GPU/CUDA is available. Here's an example on how to use it in interactive mode.

**Step 1.** Obtain a GPU node:

    salloc -N 1 -p gpu bash

**Step 2.** Check hostname of your node:

    squeue

**Step 3.** Login to your node(e.g. e1c129):

    ssh e1c129

**Step 4.** Load cuda:

    module load cuda

Now you should be able to use CUDA.
