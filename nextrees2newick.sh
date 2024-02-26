#!/bin/sh

# Extract trees from a single altnexus file

if [ $# -eq 1 ]
then

grep -i "tree " $1 | grep "&U" > temp.0
NTREES=`wc -l temp.0 | awk '{print $1}'`
echo $NTREES trees found
echo

P="p"
iter=0
while [ $iter -ne $NTREES ]
do
        iter=$(($iter+1))
        TREEID=`sed -n "$iter$P" temp.0 | awk '{print $2}'`
        echo $TREEID
        sed -n "$iter$P" temp.0 | awk '{print $5}' > $TREEID.tre
done

if [ $NTREES -gt 0 ]
then

echo
echo "Trees written as individual newick strings with extension .tre"
echo

else

echo "No trees were found in the file (or the file was not found)"
echo "Exiting..."

fi

rm temp.0

# else associated with if [ $# -eq 1 ]
else

echo
echo "Usage:"
echo "  bash extract_trees.sh input_filename"
echo
echo "The input file must be an altnexus treefile with unrooted trees. Output files"
echo "will be newick strings with the extension .tre"
echo
echo "Example of appropriate tree:"
echo "   tree treename = [&U] (tax1:0.1,tax2:0.1,(tax3:0.05,tax4:0.05):0.05);"
echo "Tree names must not include spaces"
echo

fi
