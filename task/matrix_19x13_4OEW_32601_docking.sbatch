#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4OEW_32601/output.txt

# run
python prepare_receptor.py 4OEW
python prepare_ligand.py 32601
sh prepare_config.sh 4OEW 32601

vina --out hot/4OEW_32601/model.pdbqt --log hot/4OEW_32601/report.txt --receptor data/4OEW.pdbqt --ligand data/32601.pdbqt --config hot/4OEW_32601/config.txt

python extract_score.py hot/4OEW_32601

rm task/4OEW_32601_docking.sbatch
