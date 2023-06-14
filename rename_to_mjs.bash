#!/bin/bash

# Define the target directory
target_dir="node_modules/ai-jsx/dist/esm"

# Find all .js files recursively in the target directory
find "$target_dir" -type f -name "*.js" | while read -r file; do
  # Rename the file, replacing the .js extension with .mjs
  mv "$file" "${file%.js}.mjs"
done