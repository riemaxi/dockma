#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4JP4_26261/output.txt

# run
python prepare_receptor.py 4JP4
python prepare_ligand.py 26261
sh prepare_config.sh 4JP4 26261

vina --out hot/4JP4_26261/model.pdbqt --log hot/4JP4_26261/report.txt --receptor data/4JP4.pdbqt --ligand data/26261.pdbqt --config hot/4JP4_26261/config.txt

python extract_score.py hot/4JP4_26261

rm task/matrix_19x13_4JP4_26261_docking.sbatch
