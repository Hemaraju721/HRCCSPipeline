# This script is to extract all the unique gene names from a sample file and obtain its biotype from the gtf file
#!/bin/bash

# make a list of the genes from the sample file
cut -d',' -f1 sample.txt > sample_geneNameList.txt

# Match and obtain the genes from sample file to gtf file
grep -F -f sample_geneNameList.txt < Mus_musculus.GRCm38.gtf > Mus_58.gtf

# Obtain the biotype of those genes from gtf file
cut -f9 Mus_58.gtf | cut -d';' -f4,5 > geneNames_WithBiotype.txt

# Sort the list of gene names and its biotypes
cut -f9 Mus_58.gtf | cut -d';' -f4,5 | sort > geneNames_withBiotype.sorted.txt

# Obtain the unique list of gene names and its biotypes
cut -f9 Mus_58.gtf | cut -d';' -f4,5 | sort | uniq > geneNames_withBiotype.sorted.uniq.txt

