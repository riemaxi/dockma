#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_40363/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 40363
sh prepare_config.sh 2V5Y 40363

vina --out hot/2V5Y_40363/model.pdbqt --log hot/2V5Y_40363/report.txt --receptor data/2V5Y.pdbqt --ligand data/40363.pdbqt --config hot/2V5Y_40363/config.txt

python extract_score.py hot/2V5Y_40363

rm task/matrix_19x13_2V5Y_40363_docking.sbatch
