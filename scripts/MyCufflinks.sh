#!/bin/bash
#BSUB -J All_cufflinks
#BSUB -o All_cufflinks.txt
#BSUB -e All_cufflinks.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -N
#BSUB -B
#BSUB -u hraju@med.miami.edu

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
# Cufflinks Assembling
#
#
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Input/Output Variables
GTF=/nethome/hraju/MiamiProject/RawDataFastq/Mus_musculus.GRCm38.84.gtf

BASE_INPUT_DIR2=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG1_Output/accepted_hits.bam
BASE_OUTPUT_DIR2=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG1_CufflinksOutput

# Cufflinks Assembly
cufflinks -p 16 --no-faux-reads -o $BASE_OUTPUT_DIR2 -G $GTF $BASE_INPUT_DIR2


---------------------------------------------------------------------------------------------------------------------------------------------------------
BASE_INPUT_DIR3=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG2_Output/accepted_hits.bam
BASE_OUTPUT_DIR3=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG2_CufflinksOutput


# Cufflinks Assembly
cufflinks -p 16 --no-faux-reads -o $BASE_OUTPUT_DIR3 -G $GTF $BASE_INPUT_DIR3

------------------------------------------------------------------------------------------------------------------------------------------------------
BASE_INPUT_DIR4=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG3_Output/accepted_hits.bam
BASE_OUTPUT_DIR4=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/DRG3_CufflinksOutput


# Cufflinks Assembly
cufflinks -p 16 --no-faux-reads -o $BASE_OUTPUT_DIR4 -G $GTF $BASE_INPUT_DIR4
-----------------------------------------------------------------------------------------------------------------------------------------------------

BASE_INPUT_DIR5=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN1_Output/accepted_hits.bam
BASE_OUTPUT_DIR5=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN1_CufflinksOutput


# Cufflinks Assembly
cufflinks -p 16 --no-faux-reads -o $BASE_OUTPUT_DIR5 -G $GTF $BASE_INPUT_DIR5
-----------------------------------------------------------------------------------------------------------------------------------------------------
BASE_INPUT_DIR6=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN2_Output/accepted_hits.bam
BASE_OUTPUT_DIR6=/nethome/hraju/MiamiProject/RawDataFastq/ConcateReanalyze/CGN2_CufflinksOutput


# Cufflinks Assembly
cufflinks -p 16 --no-faux-reads -o $BASE_OUTPUT_DIR6 -G $GTF $BASE_INPUT_DIR6

---------------------------------------------------------------------------------------------------------------------------------------------------


