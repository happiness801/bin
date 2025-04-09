#!/bin/bash
#   cloc-all.sh
#   Counts lines-of-code with shared settings against all folders in a directory

cloc='cloc --vcs=git --exclude-dir=node_modules --exclude-ext=json,yaml,yml,csv,md,markdown,sql,xml,html,txt,svg,properties,css,scss .'

# Loop through each item in the current directory
for item in *; do
  # Check if the item is a directory
  if [ -d "$item" ]; then
    # Perform your action here
    echo "Processing directory: $item"
	echo "============================================================"
	cd $item
	$cloc
	cd ..
	echo "============================================================"
  fi
done
