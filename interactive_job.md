# Using Compute Nodes Interactively

You can get access to the SLURM compute nodes interactively.

Get the job allocation(e.g. 2 nodes):

```bash
salloc -N 2 bash
```

Check the list of the allocated nodes:

```bash
# simple way 1
squeue
# simple way 2
echo $SLURM_JOB_NODELIST
# useful way in a script
scontrol show hostname $SLURM_JOB_NODELIST
```

Now, you should be able to ssh to one of the nodes(e.g. e1c024):

```bash
ssh e1c024
```

And also, you should be able to ssh back and forth between the allocated compute nodes.

When you want to finish the allocation, you just need to execute `exit`, and you should
get the message like this:

```bash
salloc: Relinquishing job allocation 103
salloc: Job allocation 103 has been revoked.
```
