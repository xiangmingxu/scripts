# 1 "/home/groups/science/seq/commands.txt"
# 1 "<command-line>"
# 1 "/home/groups/science/seq/commands.txt"
#!/bin/bash -x
#Assemble contigs using velveth and generate summary statistics
WORK_DIR=P.cact_assembly
HASH_LENGTH=$1
FORWARD_FILE=P.cact_411_1M_F_trim.fastq
REVERSE_FILE=P.cact_411_1M_R_trim.fastq
ASSEMBLY_NAME=P.cact

echo "Hash lengh  is  #HASH_LENGTH"
velveth $WORK_DIR $HASH_LENGTH -fastq -shortPaired -separate $FORWARD_FILE $REVERSE_FILE
velvetg $WORK_DIR -long_mult_cutoff 1 -exp_cov 6 -ins_length 700 -cov_cutoff 2 -min_contig_lgth 750
process_contigs.pl -i $WORK_DIR/contigs.fa -o $ASSEMBLY_NAME.$HASH_LENGTH
rm - R $WORK_DIR
