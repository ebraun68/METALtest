#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

############################################################################
# Set the global variables
############################################################################
my($progname) = $0;

# Change the wastrid path to the appropriate value
my($astridexec) = "./wastrid"; # path to weighted astrid executable

my($hter);
my($iter);
my($jter);
my($kter);
my($lter);
my($mter);
my($nter);
my($qter);
my($zter);

my($tempch);
my($tempvar);
my($tempstr);
my @temparray;

my($starttime) = time();
my($timevar);
my($currtime);
my($runtime);

if ( @ARGV != 4 ) {
	print "\nUsage:\n  \$ $progname <treefile> <outfile> <reps> <seed>\n\n";
	print "  treefile = newick treefile, one gene tree per line\n";
	print "  outfile  = outfile prefix\n";
	print "  reps     = number of bootstrap replicates\n";
	print "  seed     = random number seed\n";
	print "\n";
	print "  NOTE: Trees are assumed to have 0-1 branch support\n";
	print "exiting...\n\n";
	exit;
}

my($inf)  = $ARGV[0];
my($outf) = $ARGV[1];
my($reps) = $ARGV[2];
my($seed) = $ARGV[3];

############################################################################
# Read the infile (the trees)
############################################################################
my @inflist;
open (my $INF, $inf) or die "Could not open file $inf for input\n";
@inflist = <$INF>;
close($INF) or die "Could not close file $inf\n";
my($infnum) = $#inflist + 1;

print "The input file has $infnum trees\n";
print "Running $reps bootstrap analysis (seed=";
print "$seed";
print ")\n";

# Clean up the temporary file and the output file
if ( -e "$outf.bootreps.tre" ) { unlink("$outf.bootreps.tre"); }
if ( -e "temp.out.tre" ) { unlink("temp.out.tre"); }

############################################################################
# Run a Weighted ASTRID analysis without bootstrapping
############################################################################
system("$astridexec --input $inf --output $outf.tre");

############################################################################
# Run Weighted ASTRID in a loop with bootstrap replicates
############################################################################
srand($seed); # Set the random number seed

my @bootarray;

print "Running bootstrap analysis...\n";

for ($iter=0; $iter<$reps; $iter++) {
	# Report progress:
	if ( $iter % 10 == 0 ) { print "Replicate $iter"; print "...\n"; }

	# Zero out the @bootarray
	for ($jter=0; $jter<$infnum; $jter++) { $bootarray[$jter] = 0; }
	# Populate the @bootarray
	for ($jter=0; $jter<$infnum; $jter++) {
		$tempvar =  int(rand($infnum));
		$bootarray[$tempvar]++;
	}
	
	# Write a bootstrapped treefile
	open (my $BOOTF, ">$inf.bootrep.$iter") or die "Could not open file $inf.bootrep.$iter for output\n";
	for ($jter=0; $jter<$infnum; $jter++) {
		for ($kter=0; $kter<$bootarray[$jter]; $kter++) {
			print $BOOTF "$inflist[$jter]";
		}
	}
	close($BOOTF) or die "Could not close file $inf.bootrep.$iter\n";
	
	# Run the astrid analysis
	system("$astridexec --input $inf.bootrep.$iter --output temp.out.tre");
	system("cat temp.out.tre >> $outf.bootreps.tre");
	system("echo >> $outf.bootreps.tre");
	unlink("temp.out.tre");
}

print "Weighted ASTRID bootstrap run complete\n\n";

