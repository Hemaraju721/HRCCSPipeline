#!/bin/bash
#BSUB -J Cuffmerge
#BSUB -o Cuffmerge.txt
#BSUB -e Cuffmerge.err
#BSUB -q hihg
#BSUB -x
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -W 168:00
#BSUB -N
#BSUB -B
#BSUB -u hraju@med.miami.edu

GTF=/nethome/hraju/MiamiProject/RawDataFastq/Mus_musculus.GRCm38.84.gtf
INDEX=/projects/bioinf/ref/annotations/ensembl/Mus_musculus/GRCm38/Sequence/Mouse_Rm/mm38

cuffmerge -p 16 -o cuffmerge_out_gtf -g $GTF -s $INDEX cufflinks.gtf.list

