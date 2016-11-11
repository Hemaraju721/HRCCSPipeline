#!/bin/sh
#BSUB -J mouse_download_ensembl.sh
#BSUB -o /nethome/hraju/logs/mouse_download_ensembl.txt
#BSUB -e mouse_download_ensembl.err
#BSUB -q small
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -u hraju@med.miami.edu

# Ensembl Genome Download Script (Human & Mouse)
# Database Release

VERSION=68
GENOME_BASE_NAME=ensembl_mouse_$VERSION.fa
DOWNLOAD_DIR=/nethome/bioinfo/annotation/mouse_index/ensembl/$VERSION
BOWTIE_DIR=$DOWNLOAD_DIR/bowtie_index

# Create the necessary directories we'll need for this run (ensembl & bowtie)
mkdir $DOWNLOAD_DIR
mkdir $BOWTIE_DIR

#---------------------------------------------------------------------------------------------------------------------------------
#
# Download Mouse
#
echo "***********************************************"
echo "Downloading Mouse"
date '+%m/%d/%y %H:%M:%S'
echo ""

cd $DOWNLOAD_DIR

wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.1.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.2.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.3.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.4.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.5.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.6.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.7.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.8.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.9.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.10.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.11.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.12.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.13.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.14.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.15.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.16.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.17.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.18.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.19.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.X.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.Y.fa.gz
wget ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/mus_musculus/dna/Mus_musculus.GRCm38.$VERSION.dna_rm.chromosome.MT.fa.gz

#---------------------------------------------------------------------------------------------------------------------------------
#
# Extract the downloaded sequences
#
echo "***********************************************"
echo "Extracting Human Genome..."
date '+%m/%d/%y %H:%M:%S'
echo ""

gunzip `ls *.fa.gz`

echo "Concatenating into big file ..."
date '+%m/%d/%y %H:%M:%S'
echo ""

cat `ls *.fa` > $DOWNLOAD_DIR/$GENOME_BASE_NAME

mv $DOWNLOAD_DIR/$GENOME_BASE_NAME $BOWTIE_DIR

echo "Extraction Finished..."
date '+%m/%d/%y %H:%M:%S'

#---------------------------------------------------------------------------------------------------------------------------------
#
# Build a Bowtie index
#
echo "***********************************************"
echo "Creating Bowtie Index..."
date '+%m/%d/%y %H:%M:%S'
echo ""

cd $BOWTIE_DIR

bowtie2-build -f ensembl_mouse_$VERSION.fa $GENOME_BASE_NAME

echo "Bowtie Index building finished..."
echo ""
date '+%m/%d/%y %H:%M:%S'
echo ""