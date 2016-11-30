# Running An Array Job

When you want to submit a lot of serial jobs at once, Slurm's array option works well. Here's a simple example that reads each of 100 input files and outputs to result. Once you go through the steps you'll get a sense of how this `--array` option works.

## Prepare input files

```
# Create a work directory
mkdir my_array_job
cd my_array_job

# Create input files
for a in $(seq 100); do echo "this is input from input$a" > input$a; done
```

## Write a job script

Create a new file called `job.script` and edit it like this:

```
#!/bin/sh
#SBATCH -J MY_ARRAY_JOB
#SBATCH -o MY_ARRAY_JOB.%J.stdout
#SBATCH -e MY_ARRAY_JOB.%J.stderr
#SBATCH -p main
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH --array=1-100

NUM=$SLURM_ARRAY_TASK_ID

cat input$NUM > result$NUM
```

## Submit the job

```
$ sbatch job.script
```

## Check results

```
$ cat result1
```
