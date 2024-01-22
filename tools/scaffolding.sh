#!/bin/bash

folder_name=$1
folder_name=$(echo "$folder_name" | sed 's/\/$//')

# early exit if the folder already exists
if [ -d "$folder_name" ]; then
  echo "Folder $folder_name already exists"
  exit 1
fi

mkdir -p "$folder_name/input" 
mkdir -p "$folder_name/output"
mkdir -p "$folder_name/docs/images"

echo -e '### PROJECT NAME' > "$folder_name/README.md"

echo '{ "cells": [], "metadata": {}, "nbformat": 4, "nbformat_minor": 2 }' > "$folder_name/main.ipynb"

GENERATED_CONTENT="# Auto-generated from directory scaffolding"

echo -e "$GENERATED_CONTENT" > "$folder_name/input/dir.txt"
echo -e "## This directory is for input files" >> "$folder_name/input/dir.txt"

echo -e "$GENERATED_CONTENT" > "$folder_name/output/dir.txt"
echo -e "## This directory is for output files" >> "$folder_name/output/dir.txt"

echo -e "$GENERATED_CONTENT" > "$folder_name/docs/images/dir.txt"
echo -e "## This directory is for images needed for the docs" >> "$folder_name/input/dir.txt" 

echo -e "Scaffolding complete! \n\nYou can now edit your new project in the $folder_name folder."
