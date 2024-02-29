# METALtest
Supporting data and programs for an empirical test of "species tree" methods, including METAL. 

These analyses are described in:

Braun EL, Oliveros CH, White Carreiro ND, Zhao M, Glenn TC, Brumfield RT, Braun MJ, Kimball RT, Faircloth BC. (2024) Testing the mettle of METAL: A comparison of phylogenomic methods using a challenging but well-resolved phylogeny.

Programs:

wastrid_boot.pl
  - This program is depends on weighted ASTRID (https://github.com/RuneBlaze/internode)
  - Running without command line options it will provide usage instructions

```
Usage:
  $ wastrid_boot.pl <treefile> <outfile> <reps> <seed>\n\n";
  treefile = newick treefile, one gene tree per line\n";
  outfile  = outfile prefix\n";
  reps     = number of bootstrap replicates\n";
  seed     = random number seed\n";

  NOTE: Trees are assumed to have 0-1 branch support\n";
```
