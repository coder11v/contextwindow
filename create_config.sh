#!/bin/bash

# Configuration
CONFIG_FILE="config.json"

echo "[" > $CONFIG_FILE

first_bench=true

# Find all directories that contain a prompt.txt
find . -maxdepth 2 -name "prompt.txt" | while read -r prompt_path; do
    bench_dir=$(dirname "$prompt_path")
    bench_id=$(basename "$bench_dir")
    bench_names="$bench_dir/modelnames.json"
    
    # Skip the root directory or hidden directories
    if [[ "$bench_id" == "." || "$bench_id" == .* ]]; then continue; fi

    if [ "$first_bench" = true ]; then
        first_bench=false
    else
        echo "  ," >> $CONFIG_FILE
    fi

    # Read prompt content, escape for JSON
    prompt_content=$(cat "$prompt_path" | jq -Rs .)
    
    echo "  {" >> $CONFIG_FILE
    echo "    \"id\": \"$bench_id\"," >> $CONFIG_FILE
    echo "    \"prompt\": $prompt_content," >> $CONFIG_FILE
    echo "    \"models\": [" >> $CONFIG_FILE

    first_model=true
    find "$bench_dir" -mindepth 1 -maxdepth 2 -name "index.html" | while read -r index_path; do
        model_dir=$(dirname "$index_path")
        model_id=$(basename "$model_dir")
        
        # Avoid the benchmark directory itself
        if [ "$model_dir" == "$bench_dir" ]; then continue; fi
        if [[ "$model_dir" == "." ]]; then continue; fi

        if [ "$first_model" = true ]; then
            first_model=false
        else
            echo "      ," >> $CONFIG_FILE
        fi

        # Resolve model name
        model_name="$model_id"
        # Check benchmark-specific names then global names
        if [ -f "$bench_names" ]; then
            found_name=$(jq -r ".[] | select(.id == \"$model_id\") | .name" "$bench_names")
            if [ ! -z "$found_name" ] && [ "$found_name" != "null" ]; then
                model_name="$found_name"
            fi
        fi
        

        echo "      {" >> $CONFIG_FILE
        echo "        \"id\": \"$model_id\"," >> $CONFIG_FILE
        echo "        \"name\": \"$model_name\"," >> $CONFIG_FILE
        echo "        \"path\": \"$index_path\"" >> $CONFIG_FILE
        echo "      }" >> $CONFIG_FILE
    done
    
    echo "    ]" >> $CONFIG_FILE
    echo "  }" >> $CONFIG_FILE
done

echo "]" >> $CONFIG_FILE

echo "Generated $CONFIG_FILE"
