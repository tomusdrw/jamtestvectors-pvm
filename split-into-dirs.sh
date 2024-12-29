#!/bin/bash

# Directory containing JSON files
SOURCE_DIR="./pvm"
# Directory where subdirectories will be created
OUTPUT_DIR="./pvm/"

# Iterate over all JSON files in the source directory
for FILE in "$SOURCE_DIR"/*.json; do
 # Extract the filename without path and extension
  FILENAME=$(basename "$FILE")
  BASENAME="${FILENAME%.*}"
  
  # Get the length of the basename (filename without extension)
  NAME_LENGTH=${#BASENAME}
  
  # Define the subdirectory based on the length
  SUBDIR="$OUTPUT_DIR/length_$NAME_LENGTH"
  
  # Create the subdirectory if it doesn't exist
  mkdir -p "$SUBDIR"
  
  # Move the file to the appropriate subdirectory
  mv "$FILE" "$SUBDIR/"
done

echo "Files have been successfully organized by filename length!"
