# Targeted assembly recovers high ammonia monooxygenase diversity in mudflat intertides
Microbial communities in the Earth’s biosphere mediate various biogeochemical cycling processes that are essential to maintain ecosystem multifunctioning and stability, via the functional genes they carry. Although progresses are being made, obtaining high quality sequence datasets for microbial functional genes in complex environments remains challenging, both technically and the computational resources required. In this study, using the amo gene family encoding ammonia monooxygenase as an example, we proposed to recover important microbial functional genes from shotgun metagenomes via targeted assembly. Comparing to conventional assembly approaches such as single- and multi-sample assembly, targeted assembly recovered much higher amo gene diversity at the cost of dramatically declined computational resource and shorter running time. In addition, amo genes recovered by targeted assembly were found with fewer chimeras. At the meanwhile, more complete amo operons were recovered. This study demonstrated an efficient routine to recover microbial functional genes from shotgun metagenomes with minimal computational resources and running time.

## Targeted assembly
Step 1: Compare your reads or contigs with the database to obtain alignment files (e.g., DIAMOND files).
The database used in this study is NCycDB, available at [NCycDB GitHub](https://github.com/qichao1984/NCyc).

Step 2: Obtain targeted reads or contigs.
After obtaining the alignment file from Step 1, you can choose to extract targeted reads or contigs based on your needs:

For targeted reads, run `targeted_reads.sh` to generate the reads suitable for further assembly.

For targeted contigs, run `targeted_contigs.sh` to extract the contigs corresponding to the targeted regions.


