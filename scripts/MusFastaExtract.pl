#!/usr/bin/perl

# This script is to extract the fasta sequences of the protein-coding from the inputfile.
# The InputFastaFile here Mus_musculus.GRCm38.cdna.all.fa, but it could be any fasta file. 
# The output file generated will have only those sequences matching line 17, which here in this case is protein_coding

$InputFastaFile = $ARGV[0];
$OutputProteinCodingFasta = $ARGV[1];

open(FH,"$InputFastaFile") or die "Can not open infile $InputFastaFile\n";
open(OUT,">$OutputProteinCodingFasta");
while(chomp($line =<FH>)){
	if(index($line,">")==0) {
		$flag=0;
		@col=split(/\s+/,$line);
		$flag2=0;
		foreach(@col){
			
			#checking in each line of the fasta file if the gene_biotype is protein_coding
		    if($_ eq "gene_biotype:protein_coding"){    
			   $flag=1;
			   
			}
			#checking in each line of the fasta file if the gene_biotype is processed_pseudogene
		    #if($_ eq "gene_biotype:processed_pseudogene"){    
			   #$flag=1;
			   
			#}
			#checking in each line of the fasta file if the gene_biotype is pseudogene
			#if($_ eq "gene_biotype:pseudogene"){
			 #  $flag2=1;
			#}
	
		}
	}
	if($flag==1){
		#print "into the flag...\n";
		print OUT "$line\n";
#		$R=<STDIN>;
	}
	if($flag2==1){
		print "into the flag...\n";
		print OUT "$line\n";
	}
	
}

close(FH);
close(OUT);


