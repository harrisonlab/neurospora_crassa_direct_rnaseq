# Rerun 
Commands used to re-analyse N.crassa dRNAseq data

Note - all this work was performed in the directory:
/home/groups/harrisonlab/project_files/neurospora_crassa

Concatenate fastq files for LP10-11 dRNA seq data
```bash
cd /home/groups/harrisonlab/project_files/neurospora_crassa

# for run LP10-11-1b
RawDatDir=/data/seq_data/minion/2018/LP10-11-1b/GA20000
OutDir=raw_rna/minion/dRNAseq/LP10-11-1b
mkdir -p $OutDir
cat $RawDatDir/*.fastq | gzip -cf > $OutDir/LP10-11.fastq.gz

```
running minimap indexing of the genome
```bash
#qlogin reserving 8 processors and 1Gb of ram per processor
qlogin -pe smp 8 -l virtual_free=1G

cd /home/groups/harrisonlab/project_files/neurospora_crassa
RefGenome=Neurospora_crassa.NC12.dna_rm.toplevel.fa
OutIndex=Neurospora_crassa.NC12.dna_rm.toplevel.fa.mmi
minimap2 -d $OutIndex $RefGenome
RNAdat=raw_rna/minion/dRNAseq/LP10-11-1b/LP10-11.fastq.gz
minimap2 -ax splice -uf -k14 $RefGenome $RNAdat > LP10-11-aln.sam  

#convert sam to bam
samtools view -S -b LP10-11-aln.sam > LP10-11-aln.bam
#see what this looks like
samtools view LP10-11-aln.bam | head
#sort alignments into genome order
samtools sort LP10-11-aln.bam -o LP10-11.sorted.bam
#Index the genome sorted bam file
samtools index LP10-11.sorted.bam


# log out of qlogin session:
logout





```
Repeat process for LP11 Verticillium dahliae dRNAseq data
Note - all this work was performed in the directory:
/home/groups/harrisonlab/project_files/verticillium_dahliae/clocks

Concatenate fastq files for LP11-11 dRNA seq data

```bash
cd /home/groups/harrisonlab/project_files/verticillium_dahliae/clocks

# for run LP11-11
RawDatDir=/data/seq_data/minion/2019/LP11-11_LP11-11/LP11-11/20190117_1820_GA10000_FAJ15044_4f5c709f/fastq_pass
OutDir=nanopore/dRNAseq/LP11
mkdir -p $OutDir
cat $RawDatDir/*.fastq | gzip -cf > $OutDir/LP11-11.fastq.gz

```
running minimap indexing of the genome
```bash
#qlogin reserving 8 processors and 1Gb of ram per processor
qlogin -pe smp 8 -l virtual_free=1G

cd /home/groups/harrisonlab/project_files/verticillium_dahliae/clocks
RefGenome=public_genomes/JR2/Verticillium_dahliaejr2.GCA_000400815.2.dna.toplevel.fa
OutIndex=public_genomes/JR2/Verticillium_dahliaejr2.GCA_000400815.2.dna.toplevel.fa.mmi
minimap2 -d $OutIndex $RefGenome
RNAdat=nanopore/dRNAseq/LP11/LP11-11.fastq.gz
minimap2 -ax splice -uf -k14 $RefGenome $RNAdat > ./nanopore/dRNAseq/LP11/LP11-11-aln.sam  

cd nanopore/dRNAseq/LP11/
#convert sam to bam
samtools view -S -b LP11-11-aln.sam > LP11-11-aln.bam
#sort alignments into genome order
samtools sort LP11-11-aln.bam -o LP11-11.sorted.bam
#Index the genome sorted bam file
samtools index LP11-11.sorted.bam

 #log out of qlogin session:
logout

#repeat for LP11-04 data
#data location for LP11-04
/data/seq_data/minion/2019/LP11-04_LP11-04/LP11-04/20190214_1740_GA10000_FAK04899_7368d514



RawDatDir=/data/seq_data/minion/2019/LP11-04_LP11-04/LP11-04/20190214_1740_GA10000_FAK04899_7368d514/fastq_pass
OutDir=nanopore/dRNAseq/LP11
mkdir -p $OutDir



#qlogin reserving 8 processors and 1Gb of ram per processor
qlogin -pe smp 8 -l virtual_free=1G

cd /home/groups/harrisonlab/project_files/verticillium_dahliae/clocks
RefGenome=public_genomes/JR2/Verticillium_dahliaejr2.GCA_000400815.2.dna.toplevel.fa
RNAdat=nanopore/dRNAseq/LP11/LP11-04.fastq.gz
minimap2 -ax splice -uf -k14 $RefGenome $RNAdat > ./nanopore/dRNAseq/LP11/LP11-04-aln.sam  

cd nanopore/dRNAseq/LP11/
#convert sam to bam
samtools view -S -b LP11-04-aln.sam > LP11-04-aln.bam
#sort alignments into genome order
samtools sort LP11-04-aln.bam -o LP11-04.sorted.bam
#Index the genome sorted bam file
samtools index LP11-04.sorted.bam


```
