#This script is to remove non-conventional chromosomes.
#!/usr/bin/perl
$file=$ARGV[0];
chomp($file);

$fileo=$ARGV[1];
chomp($fileo);

@chrs=qw(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X Y MT);

open(FO,">$fileo");
open(FI,"$file");
while($line=<FI>){
   chomp($line);
   if(index($line,">")==0){
       $flag=0;
       @col=split(/\s+/,$line);
       $str=substr($col[0],1,length($col[0])-1);
       foreach(@chrs){
          if($str eq $_){
             $flag=1;
             last;
           }
       }
   }
   if($flag==1){
      print FO "$line\n";
   }
}
close FI;
close FO;
