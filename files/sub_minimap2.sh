#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 24
#$ -l virtual_free=1G
#$ -l h=blacklace02.blacklace|blacklace03.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace

# Wrapper to submit minimap2 jobs to the cluster
# minimap2 performs mapping the reads against reference genome
# This script needs to be run from /home/groups/harrisonlab/project_files/neurospora_crassa/

Usage="sub_poreplex.sh <minimap2_indexed_genome> <sequence.fastq>"

echo $Usage

#######  Step 1	 ########
# Initialise values
#########################

Index=$1
fastq=$2
CurDir=$PWD
Run=$(echo $2 | cut -f4 -d '/')
Run="$Run"_minimap2_aligned
OutDir=$CurDir/Minimap2/$Run/

mkdir -p $OutDir

echo "Filtered reads - $fastq"
echo "Output directory - $OutDir"

#######  Step 2	 ########
# Run minimap2
#########################

minimap2 -ax splice -u f -k 14 $Index/*mmi $fastq > Minimap2/$Run/"$Run".minimap2.sam
      
####### End of sub_minimap2.sh ##############
