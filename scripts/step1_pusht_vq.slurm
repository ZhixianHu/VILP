#!/bin/bash
#SBATCH --job-name=pusht_rep_step1
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=8
#SBATCH --account=shey-b
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

source ~/.bashrc
cd /scratch/gilbreth/hu934/code/VILP
conda activate vilpenv

export HYDRA_FULL_ERROR=1
python train.py --config-dir=./VILP/config --config-name=train_vq_pushT.yaml
