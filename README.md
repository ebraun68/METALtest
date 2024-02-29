## METALtest
Supporting data and programs for an empirical test of "species tree" methods, including METAL, described in:

Braun EL, Oliveros CH, White Carreiro ND, Zhao M, Glenn TC, Brumfield RT, Braun MJ, Kimball RT, Faircloth BC. (2024) Testing the mettle of METAL: A comparison of phylogenomic methods using a challenging but well-resolved phylogeny.

This manuscript describes multiple analyses of four datasets:
 - Complete allfam = UCE dataset with 4,307 loci sampled from 396 taxa (all orders and 250 of 253 families)
 - "Well-sampled" allfam = complete allfam dataset excluding 27 taxa with relatively poor sequence recovery
 - Jarvis UCE = UCE data from 48 taxa (from Jarvis et al. 2014, https://doi.org/10.1126/science.1253451)
 - Jarvis intron = intron data from 48 taxa (from Jarvis et al. 2014, https://doi.org/10.1126/science.1253451)

The analyses were:
 - ML concatenation (primarily IQ-TREE)
 - Weighted ASTRAL
 - Weighted ASTRID
 - SVDquartets (as implemented in PAUP*)
 - Neighbor-joining (NJ) of six different distance estimators

Methods were evaluated using the "reliable clade recovery" criterion. To identify reliable clades (clades that are very likely to be present in the true avian species tree) we summarize and evaluate earlier studies of avian phylogeny. 
We break the reliable clades into three categories: 
   1) easy clades (often recovered in analyses of individual gene regions)
   2) medium clades (typically recovered in analyses of multiple [>10] gene tregions)

### Supporting data:

### Tables
All tables are excel files:
  - S1: List of tissue sources for novel data in the allfam dataset
  - S2: Numbers of taxa sampled in each order and family
  - S3: Amount of data present for each taxon in the complete allfam dataset
  - S4: Recovery of orders in Reddy et al. 2017, https://doi.org/10.1093/sysbio/syx041 (used to establish reliable clades)
  - S5: Base composition of each taxon in the Jarvis datasets

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


