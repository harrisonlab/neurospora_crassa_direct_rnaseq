# Neurospora crassa direct RNA-Seq data (gridION) analysis
==========================================================

Scripts used for the direct RNA-Seq data analysis of Neurospora crassa.
Note - all this work was performed in the directory:
/home/groups/harrisonlab/project_files/neurospora_crassa

# Processing the read data

Data was basecalled again using Albacore 2.3.3 & trimmed 3 prime adapters on the minion server

```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-7-1a
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-7-1a
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/LP10-7-1a/GA10000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```
```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-8-1A
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-8-1A
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/20180829_LP10-8-1A/LP10-8-1A/GA10000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```
```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-8-1b
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-8-1b
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/20180829_LP10-8-1b/LP10-8-1b/GA10000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```
```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-12-1b
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-12-1b
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/20180829_LP10-12-1b/LP10-12-1b/GA20000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```
```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-12-1B
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-12-1B
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/20180829_LP10-12-1B/LP10-12-1B/GA30000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```
```bash
# Date=11-10-18
Organism=N.crassa
Run=LP10-11-1b
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p $OutDir

ssh nanopore@nanopore
screen -a

mkdir Ncrassa
cd Ncrassa

Organism=N.crassa
Run=LP10-11-1b
FlowCell="FLO-MIN106"
Kit="SQK-RNA001"
RawDatDir=/data/seq_data/minion/2018/LP10-11-1b/GA20000/reads
OutDir=/home/groups/harrisonlab/project_files/neurospora_crassa/filtered_reads/minion/$Organism/$Run
mkdir -p ~/Ncrassa/$Run
cd ~/Ncrassa/$Run

~/.local/bin/read_fast5_basecaller.py \
  --flowcell $FlowCell \
  --kit $Kit \
  --input $RawDatDir \
  --recursive \
  --worker_threads 24 \
  --save_path "$Organism"_"$Run" \
  --output_format fastq,fast5 \
  --reads_per_fastq_batch 4000
cat "$Organism"_"$Run"/workspace/pass/*.fastq | gzip -cf > "$Organism"_"$Run"_albacore_v2.3.3.fastq.gz
tar -cz -f "$Organism"_"$Run".tar.gz "$Organism"_"$Run"
scp *.gz  bonthas@192.168.1.200:$OutDir/.
```

# Mapping filtered reads against Neurospora crassa reference genome 

Using GMAP:

For complete parameters used in mapping by GMAP were presented in files/sub_gmap.sh

mkdir Gmap

The output of GMAP will be stored in Gmap directory.

```bash
qsub scripts/sub_gmap.sh filtered_reads/minion/N.crassa/LP10-7-1a/LP10-7-1a.fastq
qsub scripts/sub_gmap.sh filtered_reads/minion/N.crassa/LP10-8-1/LP10-8-1.fastq
qsub scripts/sub_gmap.sh filtered_reads/minion/N.crassa/LP10-7-1a/LP10-11-1b/LP10-11-1b.fastq
qsub scripts/sub_gmap.sh filtered_reads/minion/N.crassa/LP10-7-1a/LP10-12-1.fastq
```
# Count mapped reads using featureCounts

mkdir counts

Count mapped reads on Sense strand:

featureCounts -s 1 -a ../Neurospora_crassa.NC12.32.gff3_3 \
-t gene \
-o counts/sense.txt \
LP10-7-1a_gmap_aligned/LP10-7-1a_gmap_aligned.sam \
LP10-8-1_gmap_aligned/LP10-8-1_gmap_aligned.sam \
LP10-11-1b_gmap_aligned/LP10-11-1b_gmap_aligned.sam \
LP10-12-1_gmap_aligned/LP10-12-1_gmap_aligned.sam

Count mapped reads on Anti-sense strand:

featureCounts -s 2 -a ../Neurospora_crassa.NC12.32.gff3_3 \
-t gene \
-o counts/anti_sense.txt \
LP10-7-1a_gmap_aligned/LP10-7-1a_gmap_aligned.sam \
LP10-8-1_gmap_aligned/LP10-8-1_gmap_aligned.sam \
LP10-11-1b_gmap_aligned/LP10-11-1b_gmap_aligned.sam \
LP10-12-1_gmap_aligned/LP10-12-1_gmap_aligned.sam

Using minimap2:

Indexing reference genome file using minimap2:

Prior to mapping reads with Minimap2, the tool will require an indexed reference genome file using minimap2 and it can be done using below command - 

mkdir Minimap2

minimap2 -d minimap2/Neurospora_crassa.NC12.dna_rm.toplevel.mmi Neurospora_crassa.NC12.dna_rm.toplevel.fa

For complete parameters used in mapping by minimap2 were presented in files/sub_minimap2.sh

The output of GMAP will be stored in Minimap2 directory.

```bash
qsub scripts/sub_minimap2.sh Minimap2 filtered_reads/minion/N.crassa/LP10-7-1a/LP10-7-1a.fastq
qsub scripts/sub_minimap2.sh Minimap2 filtered_reads/minion/N.crassa/LP10-8-1/LP10-8-1.fastq
qsub scripts/sub_minimap2.sh Minimap2 filtered_reads/minion/N.crassa/LP10-11-1b/LP10-11-1b.fastq
qsub scripts/sub_minimap2.sh Minimap2 filtered_reads/minion/N.crassa/LP10-12-1/LP10-12-1.fastq
```
