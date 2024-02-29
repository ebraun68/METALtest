# METALtest
Supporting data and programs for an empirical test of "species tree" methods, including METAL. 

These analyses are described in:

Braun EL, Oliveros CH, White Carreiro ND, Zhao M, Glenn TC, Brumfield RT, Braun MJ, Kimball RT, Faircloth BC. (2024) Testing the mettle of METAL: A comparison of phylogenomic methods using a challenging but well-resolved phylogeny.

Programs:

1. wastrid_boot.pl
  - Bootstraps gene trees to generate support values for weighted ASTRID (wASTRID)
  - This program is depends on the wastrid executable (download from https://github.com/RuneBlaze/internode)
  - Set the path to the wastrid executable on line 13
  - Running without command line options it will provide usage instructions, as follows

```
Usage:
  $ wastrid_boot.pl <treefile> <outfile> <reps> <seed>\n\n";
  treefile = newick treefile, one gene tree per line\n";
  outfile  = outfile prefix\n";
  reps     = number of bootstrap replicates\n";
  seed     = random number seed\n";

  NOTE: Trees are assumed to have 0-1 branch support\n";
```
