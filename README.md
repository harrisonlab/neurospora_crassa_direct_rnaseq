# Neurospora crassa direct RNA-Seq data analysis
================================================

Scripts used for the analysis of Fusarium venenatum genomes
Note - all this work was performed in the directory:
/home/groups/harrisonlab/project_files/neurospora_crassa

The following tasks were performed on the data using poreplex program:
1. Trimming 3 prime adapters.
2. Basecalling on-fly using Albacore 2.3.0.
3. Aligning basecalled reads to Neurospora crassa reference genome (the genome must be indexed using "minimap2")

```bash
screen -a
# gridiION 08-10-2018
inputDir=/data/seq_data/minion/2018/LP10-7-1a/GA10000/reads
run=$(echo $inputDir | cut -f6 -d '/')
outDir=/home/groups/harrisonlab/project_files/neurospora_crassa/poreplex_output_"$run"
genomeIndex=/home/bonthas/projects/neurospora_crassa_direct_rnaseq/minimap2

poreplex -i $inputDir \
         -o $outDir \
         --trim-adapter \
         --keep-unsplit \
         --basecall \
         --fastq \
	 --parallel 10 \
	 --align $genomeIndex/*mmidx
	 

```
The poreplex generates fastq and bam files in $outDir.
