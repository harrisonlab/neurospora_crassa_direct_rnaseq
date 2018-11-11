# Analysis of DEG between Light and Dark in N crassa with respect to Sense strand
# Load counts table
# This table contains counts data for LP10-7, LP10-8 and LP10-11.
countSense <- read.table("countData_sense",header=T,sep="\t",row.names=1)

# Load coData
colData <- read.table("colData",header=T,sep=",")

# Create DESeq Object
ddsSense <- DESeqDataSetFromMatrix(countData=countSense,colData=colData,design=~condition)

# Run DESeq
ddsSense <- DESeq(ddsSense)

# Log transform data
rld <- rlog(ddsSense, blind=FALSE)

# Extract results
resSense <- results(ddsSense)

# Filter results with required padj value
sig.resSense <- subset(resSense,padj<=0.05)

# Reorder significant results based on padj
sig.resSense <- sig.resSense[order(sig.resSense$padj),]

# Find up/down-regulated genes based on required log2Fold change value
sig.resSense.upregulated <- sig.resSense[sig.resSense$log2FoldChange >1, ]
sig.resSense.downregulated <- sig.resSense[sig.resSense$log2FoldChange < -1, ]

# Write results to files
write.table(sig.resSense.upregulated,"NC_Sense_LD_up_LFC.txt",sep="\t",quote=F)
write.table(sig.resSense.downregulated,"NC_Sense_LD_down_LFC.txt",sep="\t",quote=F)

#===========================================
# Analysis of DGE between Light and Dark in N crassa with respect to Anti-Sense strand
# Load counts table
countAntiSense <- read.table("countData_anti_sense",header=T,sep="\t",row.names=1)

# Load coData
# colData <- read.table("colData",header=T,sep=",")

# Create DESeq Object
ddsAntiSense <- DESeqDataSetFromMatrix(countData=countAntiSense2,colData=colData,design=~condition)

# Run DESeq
ddsAntiSense <- DESeq(ddsAntiSense)

# Log transform the data
rld2 <- rlog(ddsAntiSense, blind=FALSE)

# Extract results
resAntiSense <- results(ddsAntiSense)

# Filter results with required padj value
sig.resAntiSense <- subset(resAntiSense,padj<=0.05)

# Reorder significant results based on padj
sig.resAntiSense <- sig.resAntiSense[order(sig.resAntiSense$padj),]

# Find up/down-regulated genes based on required log2Fold change value
sig.resAntiSense.upregulated <- sig.resAntiSense[sig.resAntiSense$log2FoldChange >1, ]
sig.resAntiSense.downregulated <- sig.resAntiSense[sig.resAntiSense$log2FoldChange < -1, ]

# Write results to files
write.table(sig.resAntiSense.upregulated,"NC_AntiSense_LD_up_LFC.txt",sep="\t",quote=F)
write.table(sig.resAntiSense.downregulated,"NC_AntiSense_LD_down_LFC.txt",sep="\t",quote=F)

#===========================================


