#!/user/bin
# This script is to blast the rat fasta sequences against rat probe sequences (GSE 30165), to create a reference for my downstream 
# ncrna annotation. 
# Two steps are involved - first is to create database with
# the rat fasta sequences (cdna + ncrna.fa). Second step is to run the blast between the fasta and probe sequences

# Step 1: make a database for the combined fasta sequences
makeblastdb -in Combined_mm_38.fasta -dbtype 'nucl' -out CombinedMouseBlastdb -parse_seqids;

# Step 2 : run the blast for probe sequences against the database created in step 1
blastn -db CombinedMouseBlastdb -query MousePseudo.fasta -outfmt "6 qseqid sseqid evalue bitscore stitle length mismatch gaps" -max_target_seqs '1' -out OutputBlastMousePseudoToProtein.txt;