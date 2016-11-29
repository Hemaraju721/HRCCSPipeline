#!/usr/bin/perl

# Read the antisense gene file, that has geneID, chr no, start position, end position, strand, gene name
@antisense =`cat MouseAS.txt`;
chop(@antisense);
undef @antisense_c;
undef @antisenseGene;
$antisenseGene="x";
$c=0;
foreach(@antisense) {
	chop($_);
	@col=split(/\s+/,$_);
	$antisense_c[$c][0] = $col[0]; # gene id
	$antisense_c[$c][1] = $col[1]; # chromosome
	$antisense_c[$c][2] = $col[2]; # start
	$antisense_c[$c][3] = $col[3]; # end
	$antisense_c[$c][4] = $col[4]; # strand
	$antisense_c[$c][5] = $col[5]; # gene name
	$c++;
}

# Read the GFT file that has geneID, chr no, start position, end position, strand, gene name, gene biotype
@gtf =`cat MouseGTF.txt`;
chop(@gtf);
undef @gtf_c;
undef @gtf_gene;
$gtf_gene="x";
$d=0;
foreach(@gtf) {
	chop($_);
	@col=split(/\s+/,$_);
	$gtf_c[$d][0] = $col[0]; # gene id
	$gtf_c[$d][1] = $col[1]; # chromosome
	$gtf_c[$d][2] = $col[2]; # start
	$gtf_c[$d][3] = $col[3]; # end
	$gtf_c[$d][4] = $col[4]; # strand
	$gtf_c[$d][5] = $col[5]; # gene name
	$gtf_c[$d][6] = $col[6]; # gene biotype
	$d++;
}
# Check if the chromosome numbers are same in both AS and GTF file and if the strands are unequal in both AS and GTF file
# Check if the start positions of gene in AS file is less than the end position. Also check if the start position of gene in GTF file is greater than the end position. 
# Then print the gene name in the GTF file that is on the opposite strand for the corresponding gene in the AS file

for($i=1;$i<=$c;$i++) {
#   print "$antisense_c[$i][0]\n";
	$p1=$antisense_c[$i][1];
	$p2=$antisense_c[$i][2];
	$p3=$antisense_c[$i][3];
	$p4=$antisense_c[$i][4];
	for($j=1;$j<=$d;$j++) {
	    $q1=$gtf_c[$j][1];
		$q2=$gtf_c[$j][2];
		$q3=$gtf_c[$j][3];
		$q4=$gtf_c[$j][4];
		if($p1==$q1  && $p4 ne $q4) {
			if(($p2 >= $q2 && $p2<=$q3) || ($p3 >= $q2 && $p3<=$q3) || ($p2 < $q2 && $p3 > $q3)){
			    print "$antisense_c[$i][0]\t$p1\t$p2\t$p3\t$p4\t$antisense_c[$i][5]\t$q1\t$q2\t$q3\t$q4\t$gtf_c[$j][5]\n\n";
#			    $R=<STDIN>;
		    }
		}
	}
	
}