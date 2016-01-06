# Using Nodes Interactively

You can get access to the SLURM compute nodes interactively.

Get the job allocation(e.g. 2 nodes):

```bash
salloc -N 2 bash
```

Check the list of the allocated nodes:

```bash
echo $SLURM_JOB_NODELIST
```

Now, you should be able to ssh to one of the nodes(e.g. e1c024):

```bash
ssh e1c024
```

You should be able to ssh back and forth between the allocated compute nodes.
