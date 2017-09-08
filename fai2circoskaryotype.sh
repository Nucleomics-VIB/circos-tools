#!/bin/bash
# script name: fai2circoskaryotype.sh
# build a karyotype file for circos from a assembly .fai index
#
# Stephane Plaisance (VIB-NC+BITS) 2017/09/08; v1.0
#
# visit our Git: https://github.com/Nucleomics-VIB

# get user input
if [[ $# -lt 1 ]]; then
echo "Usage: ${0##*/} <assembly.fai> <opt:prefix>";
exit 1
fi

# karyotype format
# chr - ID LABEL START END COLOR
# yeast example
# chr - chrI I 0 230218 black

# .fai format
# CP014584.1	3325186	74	80	81

if [[ -n "${2}" ]]; then
label=${2}
else
label=""
fi

cat $1 | \
gawk -v label=${label} 'BEGIN{ FS="\t";OFS="\t"}	{ 
	print "chr","-",$1,label$1,"0",$2,"black"
	}'
