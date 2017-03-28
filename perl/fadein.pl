#!/usr/bin/perl





$startVol=10;	# start volume
$endVol=80;	# finish volume 
$deltaTime=300;  # time from start to end fadein
if ($#ARGV == 2 ) {
$startVol=$ARGV[0]; 	#First value is from  volume
$endVol=$ARGV[1]; 	#Second value is to  volume 
$deltaTime=$ARGV[2]; 	#third value is time from start to end fadein
} 
$oneStep=1;
$oneTime=1;


#print "From". $startVol. "\n";
#print "ti". $endVol. "\n";
#print "time". $deltaTime. "\n";


# command  amixer --quiet set  'Power Amplifier' 
$command=" amixer --quiet set  'Power Amplifier' ";
#`$command 12`;



#math 
$steps = abs ($endVol - $startVol);
if ($steps == 0)  { die "Zero steps" };

if ($steps > $deltaTime) 
	{$oneStep = $steps/$deltaTime ; }
else 
	{$oneTime=$deltaTime/$steps; }

print "every $oneTime second make $oneStep steps\n";
$sv=$startVol;
for ($step=0; $step <$deltaTime;$step+=$oneTime)
	{ $sv+=$oneStep ;
	print "$sv and sleep ... \n ";}

$timestep = $deltaTime/$steps;

print $timestep;
