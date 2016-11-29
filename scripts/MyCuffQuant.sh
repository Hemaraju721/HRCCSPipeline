#!/bin/bash
#BSUB -J Cuffquant
#BSUB -o Cuffquant.txt
#BSUB -e Cuffquant.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -N
#BSUB -B
#BSUB -u hraju@med.miami.edu

#52_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/52_Output/accepted_hits.bam
#53_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/53_Output/accepted_hits.bam
#54_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/54_Output/accepted_hits.bam
#55_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/55_Output/accepted_hits.bam
#56_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/56_Output/accepted_hits.bam
#57_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/57_Output/accepted_hits.bam
#58_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/58_Output/accepted_hits.bam
#59_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/59_Output/accepted_hits.bam
#60_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/60_Output/accepted_hits.bam
#61_BAM=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/61_Output/accepted_hits.bam


BAM1=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/58_Output/accepted_hits.bam
BAM2=/nethome/hraju/MiamiProject/RawDataFastq/Reanalyze/59_Output/accepted_hits.bam

cuffquant -p 16 --output-dir 58_cuff merged.gtf $BAM1
cuffquant -p 16 --output-dir 59_cuff merged.gtf $BAM2

