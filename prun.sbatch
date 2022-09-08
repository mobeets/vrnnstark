#!/bin/bash
#SBATCH -J pytorch 			# A single job name for the array
#SBATCH -n 1                # Number of cores
#SBATCH -t 0-04:00          # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p shared           # Partition to submit to
#SBATCH --mem=4000           # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o pytorch_%A_%a.out # Standard output (jobid and array index)
#SBATCH -e pytorch_%A_%a.err # Standard error (jobid and array index)

# Load software modules and source conda environment
module load python/3.8.5-fasrc01
source activate pt38

# Run program
srun -c 1 python quick_train.py test"${SLURM_ARRAY_TASK_ID}"