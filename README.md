# Targeted-Assembly
Step 1: Compare your reads or contigs with the database to obtain alignment files (e.g., DIAMOND files).
The database used in this study is NCycDB, available at [NCycDB GitHub](https://github.com/qichao1984/NCyc).

Step 2: Obtain targeted reads or contigs.
After obtaining the alignment file from Step 1, you can choose to extract targeted reads or contigs based on your needs:
For targeted reads, run ./targeted_reads.sh to generate the reads suitable for further assembly.
For targeted contigs, run ./targeted_contigs.sh to extract the contigs corresponding to the targeted regions.
