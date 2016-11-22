Using GPU/CUDA
==============

## Using GPU by a job script.

To use GPU, you need to submit your job on the `gpu` partition, and reserve a gpu card by `#SBATCH --gres=gpu:1`, and load cuda module by `module load cuda`.

The following is an example of job script.

```
#!/bin/sh
#SBATCH -J CUDA_TEST
#SBATCH -o CUDA_TEST.%J.stdout
#SBATCH -e CUDA_TEST.%J.stderr
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH -N 1
#SBATCH -t 10:00

sleep 3
module load cuda

#
# Write your script bellow
#
echo ============== START ==============
# just check Cuda version
nvcc --version
echo =============== END ===============
sleep 3
```

Then submit it by the `sbatch` command like this:

```
sbatch job.script
```

> NOTE: Replace `job.script` by the name of your job script file.

## Using GPU interactively

**Step 1.** Obtain a GPU node:

```
salloc -N 1 -p gpu --gres=gpu:1 bash
```

**Step 2.** Check hostname of your node:

```
squeue
```

**Step 3.** Login to your node(e.g. e1c129):

```
ssh e1c129
```

**Step 4.** Load cuda:

```
module load cuda
```

Now you should be able to use CUDA.

```
nvcc --version
```
