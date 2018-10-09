# neurospora_crassa_direct_rnaseq
Direct RNA-Seq data analysis of Neurospora crassa.

This file presents about running poreplex on direct RNA sequencing data to perform:
1. Trimming 3` adapters
2. Basecalling using Albacore 2.3.0
3. Aligning basecalled reads to reference genome indexed using "minimap2" program

inputDir=/data/seq_data/minion/2018/LP10-7-1a/GA10000/reads
outDir=/home/groups/harrisonlab/project_files/neurospora_crassa/poreplex_output_LP10-7-1a
genomeIndex=/home/bonthas/projects/neurospora_crassa_direct_rnaseq/minimap2

poreplex -i $inputDir \
         -o $outDir \
         --trim-adapter \
         --keep-unsplit \
         --basecall \
         --fastq \
	 --parallel 10 \
	 --align $genomeIndex/*mmidx
        

