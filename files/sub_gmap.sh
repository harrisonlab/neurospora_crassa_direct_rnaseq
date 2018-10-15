#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 16
#$ -l virtual_free=1G
#$ -l h=blacklace02.blacklace|blacklace03.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace

# Wrapper to submit GMAP jobs to the cluster
# GMAP performs mapping the reads against reference genome
# This script needs to be run from /home/groups/harrisonlab/project_files/neurospora_crassa/

Usage="sub_poreplex.sh <sequence.fastq>"

echo $Usage

fastq=$1
CurDir=$PWD
Run=$(echo $1 | cut -f4 -d '/')
Run="$Run"_gmap_aligned
OutDir=$CurDir/Gmap/$Run/

mkdir -p $OutDir

echo "Filtered reads - $fastq"
echo "Output directory - $OutDir"

gmap -d ncrassa -Z -A $fastq -z sense_force -n 0 -f samse -B 5 --cross-species > Gmap/$Run/"$Run".sam 2> Gmap/$Run/"$Run".sam.log

gmap -d ncrassa -Z -A $fastq -z sense_force -n 0 -f 6 -B 5 --cross-species > Gmap/$Run/"$Run".splicesites 2> Gmap/$Run/"$Run".splicesites.log
        
####### End of sub_gmap.sh ##############
