#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZTQ_26602/output.txt

# run
python prepare_receptor.py 4ZTQ
python prepare_ligand.py 26602
sh prepare_config.sh 4ZTQ 26602

vina --out hot/4ZTQ_26602/model.pdbqt --log hot/4ZTQ_26602/report.txt --receptor data/4ZTQ.pdbqt --ligand data/26602.pdbqt --config hot/4ZTQ_26602/config.txt

python extract_score.py hot/4ZTQ_26602

rm task/4ZTQ_26602_docking.sbatch
