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
 - Weighted ASTRAL (wASTRAL)
 - Weighted ASTRID (wASTRID)
 - SVDquartets (as implemented in PAUP*)
 - Neighbor-joining (NJ) of six different distance estimators

Methods were evaluated using the "reliable clade recovery" criterion. To identify reliable clades (clades that are very likely to be present in the true avian species tree) we summarize and evaluate earlier studies of avian phylogeny. 
We break the reliable clades into three categories: 
   1) easy clades (often recovered in analyses of individual gene regions)
   2) medium clades (typically recovered in analyses of multiple [>10] gene tregions)
   3) hard clades (likely to be correct but only recovered in phylogenomic studies)

Supporting data:
 - 

### Tables
All tables are excel files:
  - S1: List of tissue sources for novel data in the allfam dataset
  - S2: Numbers of taxa sampled in each order and family
  - S3: Amount of data present for each taxon in the complete allfam dataset
  - S4: Recovery of orders in Reddy et al. 2017, https://doi.org/10.1093/sysbio/syx041 (used to establish reliable clades)
  - S5: Base composition of each taxon in the Jarvis datasets

### Files
All nexus treefiles have a taxon block and a trees block (so they can be opened in PAUP* or by FigTree) as well as comments describing their contents. The individual trees can be extracted as newick files using the nextrees2newick.sh script described below.
  - S1: Nexus treefile for the complete allfam dataset
  - S2: Nexus treefile for the well-sampled allfam dataset
  - S3: Nexus treefile for both Jarvis datasets
  - Newick_SVDquartets_exhaustive_nonpasserines.tre: single tree, newick format, for the exhaustive sampling SVDquartets tree for non-passerines (including crocodilian outgroups) + a small number of passerines (to allow the tree to be combined with the passerine tree).
  - Newick_SVDquartets_exhaustive_passerines.tre:single tree, newick format, for the exhaustive sampling SVDquartets tree for passerines + a small number of non-passerines (to allow the tree to be combined with the passerine tree).

### Figure
pdf with wASTRAL, wASTRID, and SVDquartets trees for the Jarvis intron dataset. Trees are also included in File S3.

### Perl program:

### wastrid_boot.pl
  - Bootstraps gene trees to generate support values for weighted ASTRID (wASTRID)
  - This program is depends on the wastrid executable (download from https://github.com/RuneBlaze/internode)
  - Set the path to the wastrid executable on line 13
  - Running without command line options it will provide usage instructions, as follows

```
perl wastrid_boot.pl
  - will result in the following output:

Usage:
  $ wastrid_boot.pl <treefile> <outfile> <reps> <seed>
  treefile = newick treefile, one gene tree per line
  outfile  = outfile prefix
  reps     = number of bootstrap replicates
  seed     = random number seed

  NOTE: Trees are assumed to have 0-1 branch support
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


