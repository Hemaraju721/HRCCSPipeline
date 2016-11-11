#!/usr/bin/perl

@linc =`cat lincRNA.txt`;
chomp(@linc);
undef @linc_c;
undef @linc_gene;
$linc_gene="x";
$c=0;
foreach(@linc) {
	chop($_);
	@col=split(/\s+/,$_);
	$linc_c[$c][0] = $col[1];
	$linc_c[$c][1] = $col[2] - 500000;
	$linc_c[$c][2] = $col[3] + 500000; 
	$c++;
	push(@linc_gene,$col[0]);
	
}
#shift(@linc_gene);
$num=@linc_gene;
print "$num\n";

@degs =`cat ProteinCoding3.txt`;
chomp(@degs);
undef @degs_c;
undef @degs_gene;
$degs_gene="x";
$d=0;
foreach(@degs) {
	chop($_);
	@col=split(/\s+/,$_);
	$degs_c[$d][0] = $col[1];
	$degs_c[$d][1] = $col[2];
	$degs_c[$d][2] = $col[3]; 
	$d++;
	push(@degs_gene,$col[0]);
}
#shift(@degs_gene);
#$num1=@degs_gene;
#print "$num1\n";


for($i=0;$i<=$c;$i++) {
    print "$linc_gene[$i]\n";
	for($j=0;$j<=3891;$j++) {
		if($linc_c[$i][0] eq $degs_c[$j][0]) {
			#print "linc chr: $linc_c[$i][0]\t DEG chr: $degs_c[$j][0]\n";
			#if($degs_c[$j][1] >= $linc_c[$i][1] && $degs_c[$j][2] <= $linc_c[$i][2]) {
			#	$distance1 = $degs_c[$j][1] - $linc_c[$i][1];
			#	$distance2 = $degs_c[$j][2] - $linc_c[$i][2];
			#	print "Linc Gene Name: $linc_gene[$i]\t linc chr: $linc_c[$i][0]\t DE Gene Name $degs_gene[$j]\t DEG chr: $degs_c[$j][0]\t Distance 1:$distance1\t Distance 2:$distance2 \n";
				
			if($degs_c[$j][1] > $linc_c[$i][1] && $degs_c[$j][2] > $linc_c[$i][1]) {
				$distance1 = $degs_c[$j][1] - $linc_c[$i][1];
				print "Gene on the left: Linc Gene Name: $linc_gene[$i]\t linc chr: $linc_c[$i][0]\t DE Gene Name $degs_gene[$j]\t DEG chr: $degs_c[$j][0]\t Distance from linc start:$distance1\t \n";
			}	
			
			if($degs_c[$j][1] < $linc_c[$i][2] && $degs_c[$j][2] < $linc_c[$i][2]) {
				$distance2 = $linc_c[$i][2] - $degs_c[$j][1];
				print "Gene on the right: Linc Gene Name: $linc_gene[$i]\t linc chr: $linc_c[$i][0]\t DE Gene Name $degs_gene[$j]\t DEG chr: $degs_c[$j][0]\t Distance from linc end :$distance2\t \n";
			}	
			}
			
			
		}
	}
