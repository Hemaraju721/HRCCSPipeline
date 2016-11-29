#!/bin/bash
#BSUB -J DRG1
#BSUB -o DRG1.txt
#BSUB -e DRG1.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -u hraju@med.miami.edu

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
# TopHat SE Alignment
#
#
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Input Variables

# Sample Name
#SAMPLE=/nethome/hraju/MiamiProject/RawDataFastq/52.fastq

# Annotations
ANNOTATION_GTF=/nethome/hraju/MiamiProject/RawDataFastq/Mus_musculus.GRCm38.84.gtf

# Reference Type Var
#REF=genome

# Input/Output Variables
BASE_OUTPUT_DIR=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG1_Output/
BASE_INPUT_DIR=/nethome/hraju/MiamiProject/RawDataFastq/DRG1.fastq

# Miscellaneous Index Variables
INDEX=/projects/bioinf/ref/annotations/ensembl/Mus_musculus/GRCm38/Sequence/Mouse_Rm/mm38

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#
# TopHat Alignment Operations
#
#

echo ""
echo "-  Aligning with tophat..."
echo ""

# Alignment
tophat2 -p 16 --no-coverage-search -G $ANNOTATION_GTF -o $BASE_OUTPUT_DIR $INDEX $BASE_INPUT_DIR

# Sort the BAM file
echo ""
echo "-  Sorting the BAM file..."
echo ""
samtools sort $BASE_OUTPUT_DIR/accepted_hits.bam $BASE_OUTPUT_DIR/accepted_hits.sorted
samtools index $BASE_OUTPUT_DIR/accepted_hits.sorted.bam

# Extract the FlagStat data from the unfiltered BAM filec
echo ""
echo "-  extracting the flagstat data..."
echo ""
samtools flagstat $BASE_OUTPUT_DIR/accepted_hits.bam > $BASE_OUTPUT_DIR/flagStats-all.txt

# Get the "High Quality Unique" (MAPQ=30) Alignments
echo ""
echo "-  extracting the high quality unique alignments..."
echo ""
samtools view -b -q 30 $BASE_OUTPUT_DIR/accepted_hits.bam > $BASE_OUTPUT_DIR/accepted_hits-mapq30.bam
samtools sort $BASE_OUTPUT_DIR/accepted_hits-mapq30.bam $BASE_OUTPUT_DIR/accepted_hits-mapq30.sorted
samtools index $BASE_OUTPUT_DIR/accepted_hits-mapq30.sorted.bam
samtools flagstat $BASE_OUTPUT_DIR/accepted_hits-mapq30.bam > $BASE_OUTPUT_DIR/flagStats-mapq30.txt
