#!/bin/bash
#BSUB -J Cuffdiff_Concat
#BSUB -o Cuffdiff_Concat.txt
#BSUB -e Cuffdiff_Concat.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -N
#BSUB -B
#BSUB -u hraju@med.miami.edu

BAM1=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG1_Output/accepted_hits.sam
BAM2=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG2_Output/accepted_hits.sam
BAM3=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG3_Output/accepted_hits.sam
BAM4=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN1_Output/accepted_hits.sam
BAM5=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN2_Output/accepted_hits.sam

MERGE_GTF=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/cuffmerge_out_gtf/merged.gtf

cuffdiff -p 16 -o OutputCuffdiff -L DRG,CGN -u $MERGE_GTF $BAM1,$BAM2,$BAM3 $BAM4,$BAM5
#cuffdiff -p 16 -o OutputCuffdiff -L DRG,CGN -u $MERGE_GTF $BAM1,$BAM2,$BAM3,$BAM4,$BAM5,$BAM6  $BAM7,$BAM8,$BAM9,$BAM10