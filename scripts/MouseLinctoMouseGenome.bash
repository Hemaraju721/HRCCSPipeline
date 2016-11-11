#!/user/bin
# This script is to blast the mouse SN pseudogenes sequences against rat genome sequences (GSE 30165), to check if the pseudogenes match
# Two steps are involved - first is to create database with
# the rat fasta sequences (cdna + ncrna.fa). Second step is to run the blast between the mouse pseudogenes and rat fasta sequences

# Step 1: make a database for the combined fasta sequences
makeblastdb -in Combined_mm_38.fasta -dbtype 'nucl' -out CombinedMouseBlastdb -parse_seqids;

# Step 2 : run the blast for probe sequences against the database created in step 1
blastn -db CombinedMouseBlastdb -query Mouse_SN_linc.txt -outfmt "6 qseqid sseqid stitle pident evalue bitscore length mismatch gaps" -max_target_seqs '1' -out OutputMouseLincMouseGenome.txt;

