#!/bin/bash

target=""
output_dir="/copilot/output/"

# Parse command line arguments
while getopts "d:" opt; do
  case ${opt} in
    d)
      target=$OPTARG
      ;;
    *)
      ;;
  esac
done

if [[ -n $target ]]; then
  output_dir="$output_dir$target-$(date +"%Y%m%d_%H%M%S")/"
else
  output_dir="$output_dir$(date +"%Y%m%d_%H%M%S")/"
fi

/usr/bin/webcopilot -o "$output_dir" "$@"

