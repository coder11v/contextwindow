#!/bin/bash

# add_result.sh - Quickly add a new model result to a benchmark.

if [ "$#" -lt 3 ]; then
    echo "Usage: ./add_result.sh <benchmark_id> <model_id> <path_to_index.html>"
    exit 1
fi

BENCH_ID=$1
MODEL_ID=$2
FILE_PATH=$3

# Ensure benchmark exists
if [ ! -d "$BENCH_ID" ]; then
    echo "Benchmark directory '$BENCH_ID' does not exist."
    echo "Creating benchmark directory '$BENCH_ID'..."
    mkdir -p "$BENCH_ID"
    # Prompt user for prompt.txt content if first time
    touch "$BENCH_ID/prompt.txt"
    echo "Please add the prompt content to $BENCH_ID/prompt.txt"
fi

# Create model directory
mkdir -p "$BENCH_ID/$MODEL_ID"

# Copy index.html
cp "$FILE_PATH" "$BENCH_ID/$MODEL_ID/index.html"

echo "Added result to $BENCH_ID/$MODEL_ID/index.html"

# Run create_config.sh
bash create_config.sh

echo "Done!"
