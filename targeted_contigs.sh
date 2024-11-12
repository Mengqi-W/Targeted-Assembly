#!/bin/bash

reset_color=$(tput sgr0)

# Filter your threshold
awk '$3 > 30' final.contigs.diamond > final.contigs.30%.diamond
if [ $? -eq 0 ]; then
    echo "Generated: final.contigs.30%.diamond"
else
    echo "${reset_color}Error: Failed to generate final.contigs.30%.diamond"
    exit 1
fi

# Use your database
awk 'NR==FNR{a[$1];next}($2 in a){print}' id2gene.map final.contigs.30%.diamond > final.contigs.30%.pair.diamond
if [ $? -eq 0 ]; then
    echo "Generated: final.contigs.30%.pair.diamond"
else
    echo "${reset_color}Error: Failed to generate final.contigs.30%.pair.diamond"
    exit 1
fi

awk '{print $1}' final.contigs.30%.pair.diamond >> final.contigs.30%.pair.diamond.id.txt
if [ $? -eq 0 ]; then
    echo "Generated: final.contigs.30%.pair.diamond.id.txt"
else
    echo "${reset_color}Error: Failed to generate final.contigs.30%.pair.diamond.id.txt"
    exit 1
fi

sed -i 's/^/>/' final.contigs.30%.pair.diamond.id.txt
if [ $? -eq 0 ]; then
    echo "Processed: final.contigs.30%.pair.diamond.id.txt"
else
    echo "${reset_color}Error: Failed to process final.contigs.30%.pair.diamond.id.txt"
    exit 1
fi

awk 'NR==FNR {ids[$1]; next} $1 in ids {print; for (i=1; i<=1; i++) {getline; print}}' final.contigs.30%.pair.diamond.id.txt final.contigs.fa > final.contigs.30%.pair.extract.fq
if [ $? -eq 0 ]; then
    echo "Generated: final.contigs.30%.pair.extract.fq"
else
    echo "${reset_color}Error: Failed to generate final.contigs.30%.pair.extract.fq"
    exit 1
fi
