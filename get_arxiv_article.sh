#!/bin/bash

# Function to display an error message and exit the script
error() {
  echo "Alas! An error has befallen us: $1" >&2
  exit 1
}

# Enter the arXiv ID of the article you wish to summon
echo "Enter the arXiv ID of the article you wish to summon:"
read arxiv_id

# Verify if the arXiv ID is valid
if [[ ! $arxiv_id =~ ^[0-9]+(\.[0-9]+)?v[0-9]+$ ]]; then
  error "The arXiv ID appears to be enchanted. Pray, try again."
fi

# Retrieve metadata for the article in JSON format
metadata=$(curl -s "http://export.arxiv.org/api/query?id_list=$arxiv_id&format=json")

# Check if the article exists
if [[ $(echo "$metadata" | jq '.["opensearch:totalResults"]') == "0" ]]; then
  error "No parchment found bearing the given arXiv ID."
fi

# Find the title of the article and remove unwanted characters
title=$(echo "$metadata" | jq -r '.entries[0].title' | sed 's/[^a-zA-Z0-9._-]/_/g')

# Retrieve the PDF file for the article and give it a name based on the title
echo "Summoning the article and bestowing the name $title.pdf upon it..."
curl -sf "https://arxiv.org/pdf/$arxiv_id.pdf" -o "$title.pdf"

# Check if the download was successful
if [ $? -ne 0 ]; then
  error "A dark force interrupted the summoning. Pray, try again."
fi

echo "Hark! The deed is done! Thy article now bears the name $title.pdf."
