#!/bin/bash
#SBATCH --chdir /scratch/izar/jchavero
#SBATCH --partition=gpu
#SBATCH --qos=gpu_free
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --time=1:0:0
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem 16G
#SBATCH --account cs307
#SBATCH --reservation cs307-gpu

echo STARTING AT `date`

module load gcc openmpi py-torch py-torchvision cuda
source ~/opt/izar1/venv-gcc/bin/activate
cd ~/Gen6D                                    
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name spacecraft/hubble

echo FINISHED at `date`
