#!/bin/bash
#BSUB -J All_cuffdiff
#BSUB -o All_cuffdiff.txt
#BSUB -e All_cuffdiff.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -N
#BSUB -B
#BSUB -u hraju@med.miami.edu

BAM1=/nethome/hraju/MiamiProject/RawDataFastq/52_Output/accepted_hits.sam
BAM2=/nethome/hraju/MiamiProject/RawDataFastq/53_Output/accepted_hits.sam
BAM3=/nethome/hraju/MiamiProject/RawDataFastq/54_Output/accepted_hits.sam
BAM4=/nethome/hraju/MiamiProject/RawDataFastq/55_Output/accepted_hits.sam
BAM5=/nethome/hraju/MiamiProject/RawDataFastq/56_Output/accepted_hits.sam
BAM6=/nethome/hraju/MiamiProject/RawDataFastq/57_Output/accepted_hits.sam
BAM7=/nethome/hraju/MiamiProject/RawDataFastq/58_Output/accepted_hits.sam
BAM8=/nethome/hraju/MiamiProject/RawDataFastq/59_Output/accepted_hits.sam
BAM9=/nethome/hraju/MiamiProject/RawDataFastq/60_Output/accepted_hits.sam
BAM10=/nethome/hraju/MiamiProject/RawDataFastq/61_Output/accepted_hits.sam

MERGE_GTF=/nethome/hraju/MiamiProject/RawDataFastq/merged_asm/merged.gtf

cuffdiff -p 16 -o OutputCuffdiff -L DRG,CGN -u $MERGE_GTF $BAM1,$BAM2,$BAM3,$BAM4,$BAM5,$BAM6  $BAM7,$BAM8,$BAM9,$BAM10