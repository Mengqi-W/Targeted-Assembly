```sh
#!/bin/bash

set -e

for file in *.diamond; do    
    base="${file%.diamond}"    

    # Filter your threshold
    awk '$3 >= 30' "$file" > "${base}.30%.diamond"
    echo "Generated: ${base}.30%.diamond"

    # Use your database
    awk 'NR==FNR{a[$1];next}($2 in a){print}' id2gene.map "${base}.30%.diamond" > "${base}.30%.pair.diamond"
    echo "Generated: ${base}.30%.pair.diamond"
        
    awk '{print $1}' "${base}.30%.pair.diamond" > "${base}.30%.pair.diamond.id.txt"
    echo "Generated: ${base}.30%.pair.diamond.id.txt"
done


for file in *_1.30%.pair.diamond.id.txt; do    
    prefix="${file%_1.30%.pair.diamond.id.txt}"
       
    if [[ -f "${prefix}_1.30%.pair.diamond.id.txt" && -f "${prefix}_2.30%.pair.diamond.id.txt" ]]; then
        cat "${prefix}_1.30%.pair.diamond.id.txt" "${prefix}_2.30%.pair.diamond.id.txt" | sort -u > "${prefix}.30%.pair.diamond.id.uniq.txt"
        echo "Generated: ${prefix}.30%.pair.diamond.id.uniq.txt"
    fi
        
    if [[ -f "${prefix}.30%.pair.diamond.id.uniq.txt" ]]; then
        sed -i 's/^/@/' "${prefix}.30%.pair.diamond.id.uniq.txt"
        echo "Generated: ${prefix}.30%.pair.diamond.id.uniq.txt"
    fi
        
    if [[ -f "${prefix}.30%.pair.diamond.id.uniq.txt" && -f "${prefix}_1.fq" ]]; then
        awk 'NR==FNR {ids[$1]; next} $1 in ids {print; for (i=1; i<=3; i++) {getline; print}}' "${prefix}.30%.pair.diamond.id.uniq.txt" "${prefix}_1.fq" > "${prefix}_1.30%.pair.extract.fq"
        echo "Generated: ${prefix}_1.30%.pair.extract.fq"
    fi
        
    if [[ -f "${prefix}.30%.pair.diamond.id.uniq.txt" && -f "${prefix}_2.fq" ]]; then
        awk 'NR==FNR {ids[$1]; next} $1 in ids {print; for (i=1; i<=3; i++) {getline; print}}' "${prefix}.30%.pair.diamond.id.uniq.txt" "${prefix}_2.fq" > "${prefix}_2.30%.pair.extract.fq"
        echo "Generated: ${prefix}_2.30%.pair.extract.fq"
    fi
done
```
