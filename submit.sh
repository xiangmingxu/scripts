#!/bin/bash
# Simple script to automate submission process
# for different hash length

cd $PWD

FORWARD_FILE=P_cact.411_1M_F_trim_fastq
REVERSE_FILE=P.cact_411_1M_R_trim_fastq
ASSEMLY=P.cact

for HASH_LENGTH in $( seq 21 6 51 ); do
    qsub ~/scripts/align.sh $HASH_LENGTH $FORWARD_FILE $REVERSE_FILE $ASSEMBLY
done
