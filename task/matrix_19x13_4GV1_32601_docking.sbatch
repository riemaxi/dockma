#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4GV1_32601/output.txt

# run
python prepare_receptor.py 4GV1
python prepare_ligand.py 32601
sh prepare_config.sh 4GV1 32601

vina --out hot/4GV1_32601/model.pdbqt --log hot/4GV1_32601/report.txt --receptor data/4GV1.pdbqt --ligand data/32601.pdbqt --config hot/4GV1_32601/config.txt

python extract_score.py hot/4GV1_32601

rm task/matrix_19x13_4GV1_32601_docking.sbatch
