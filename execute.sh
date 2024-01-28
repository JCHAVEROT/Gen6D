#!/bin/bash
#SBATCH --chdir /scratch/izar/jchavero
#SBATCH --partition=gpu
#SBATCH --qos=gpu_free
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem 16G

echo STARTING AT `date`

echo "Loading modules"
module load gcc openmpi py-torch py-torchvision cuda

echo "Launching the Virtual Environment"
source ~/opt/izar1/venv-gcc/bin/activate

echo "Navigating to the directory and executing the task"
cd ~/Gen6D 
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name linemod/duck --symmetric                                          
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name spacecraft/hubble --symmetric
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name spacecraft/jwst --symmetric
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name spacecraft/cosmos --symmetric
python eval.py --cfg configs/gen6d_pretrain.yaml --object_name spacecraft/rocket --symmetric

echo FINISHED AT `date`