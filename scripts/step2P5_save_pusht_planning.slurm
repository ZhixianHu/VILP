#!/bin/bash
#SBATCH --job-name=step2P5_save_pusht_planning_rep
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=8
#SBATCH --account=shey-b
#SBATCH --output=/scratch/gilbreth/hu934/code/VILP/logs/%x_%j.out
#SBATCH --error=/scratch/gilbreth/hu934/code/VILP/logs/%x_%j.err

source ~/.bashrc
cd /scratch/gilbreth/hu934/code/VILP
conda activate vilpenv

export HYDRA_FULL_ERROR=1

python train.py --config-dir=./VILP/config --config-name=save_vilp_pushT_planning.yaml hydra.run.dir=data/outputs/train_vilp_pushT_planning
