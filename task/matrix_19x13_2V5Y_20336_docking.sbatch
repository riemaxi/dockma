#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_20336/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 20336
sh prepare_config.sh 2V5Y 20336

vina --out hot/2V5Y_20336/model.pdbqt --log hot/2V5Y_20336/report.txt --receptor data/2V5Y.pdbqt --ligand data/20336.pdbqt --config hot/2V5Y_20336/config.txt

python extract_score.py hot/2V5Y_20336

rm task/matrix_19x13_2V5Y_20336_docking.sbatch
