#!/usr/bin/bash
#SBATCH --job-name=mednerf
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-node=2
#SBATCH --ntasks-per-node=1
#SBATCH --time=96:00:00
#SBATCH --mem=32GB
#SBATCH --output=/q/SYNTHETIC-ANGIO-AI/jkshirsagar/slurm/logs/dmednerf/jkshirsagar-%x-job%j.out

pwd; hostname; date

export PROJECT_DIR=/q/
export SCRATCH=/staging/
export SINGULARITY_TMPDIR=$SCRATCH
export JUPYTERLAB_WORKSPACES_DIR=/q/SYNTHETIC-ANGIO-AI/

unset XDG_RUNTIME_DIR

# source /home/jkshirsagar/anaconda3/bin/activate /home/jkshirsagar/anaconda3/envs/campari
which python
python /q/SYNTHETIC-ANGIO-AI/jkshirsagar/dmednerf/mednerf/graf-main/train_dmednerf.py /q/SYNTHETIC-ANGIO-AI/jkshirsagar/dmednerf/mednerf/graf-main/configs/angio.yaml
# nvidia-smi