## METALtest
Supporting data and programs for an empirical test of "species tree" methods, including METAL. 

These analyses are described in:

Braun EL, Oliveros CH, White Carreiro ND, Zhao M, Glenn TC, Brumfield RT, Braun MJ, Kimball RT, Faircloth BC. (2024) Testing the mettle of METAL: A comparison of phylogenomic methods using a challenging but well-resolved phylogeny.

This manuscript describes multiple analyses of four datasets:
 - Complete allfam = UCE dataset 
 - "Well-sampled" allfam =
 - Jarvis UCE = UCE data from 48 taxa ; from Jarvis et al. (2014) https://doi.org/10.1126/science.1253451

### Supporting data:

### Tables
All tables are excel files:
  - S1: List of tissue sources for the allfam dataset
  - S2: 

### Perl program:

### wastrid_boot.pl
  - Bootstraps gene trees to generate support values for weighted ASTRID (wASTRID)
  - This program is depends on the wastrid executable (download from https://github.com/RuneBlaze/internode)
  - Set the path to the wastrid executable on line 13
  - Running without command line options it will provide usage instructions, as follows

```
perl wastrid_boot.pl

Usage:
  $ wastrid_boot.pl <treefile> <outfile> <reps> <seed>\n\n";
  treefile = newick treefile, one gene tree per line\n";
  outfile  = outfile prefix\n";
  reps     = number of bootstrap replicates\n";
  seed     = random number seed\n";

  NOTE: Trees are assumed to have 0-1 branch support\n";
```
### Shell scripts:

Three scripts to simplify use of the "mettle of METAL" data

### nextrees2newick.sh
  - Extracts individual trees from the nexus treefile as individual newick strings
  - Run like this:
```
bash nextrees2newick.sh <treefile>
```

### rename_allfam.sh and rename_Jarvis.sh
  - Change taxon abbreviations (used in data files) to ORDER_Family_Genus_species format


