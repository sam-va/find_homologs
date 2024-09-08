#!/usr/bin/env bash

query_file="$1"
subject_file="$2"
output_file="$3"

blastn -query "$query_file" -subject "$subject_file" -task blastn-short -outfmt "6 pident length sseqid sstart send" | awk '$1 == 100 && $2 == 28' > "$output_file"

num_ident_seq=$(wc -l < "$output_file")

echo "Number of perfect matches: $num_ident_seq"
