#!/bin/bash

# Define ldd input and blacklist as constants
ldd_input="/usr/lib/librenderdoc.so /usr/bin/qrenderdoc /usr/bin/renderdoccmd"
ldd_blacklist="renderdoc"

# Function for verbose output
verbose_output() {
    if $verbose; then
        if $single_line; then
            echo -n "$1: "
            echo "$2" | awk '{ printf "%s ", $0 }'
        else
            echo "$1:"
            echo "$2" | awk '{printf "\t%s\n", $0}'
        fi
    fi
}

# Defaults
single_line=false
verbose=false

usage() {
    echo "Usage: $0 [-s|--single-line] [-v|--verbose] [-h|--help]"
    echo ""
    echo "Options:"
    echo "  -s, --single-line    Print output on a single line"
    echo "  -v, --verbose        Print intermediate values for debugging"
    echo "  -h, --help           Show help message"
    exit $1
}

# Parse command line arguments
while (( "$#" )); do
  case "$1" in
    -s|--single-line)
      single_line=true
      shift 1
      ;;
    -v|--verbose)
      verbose=true
      shift 1
      ;;
    -h|--help)
      usage 0
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Error: Unsupported flag $1" >&2
      usage 1
      ;;
  esac
done

# Fetch library paths used by the given programs, excluding those in the blacklist
lib_paths=$(ldd $ldd_input | awk '{ print $3 }' | grep '/' | grep -v $ldd_blacklist | sort -u)
verbose_output "lib_paths" "$lib_paths"

# Fetch the packages owning these libraries
packages=$(pacman -Qo $lib_paths | awk '{print $5}' | sort -u)
#packages=$(pacman -Qo  /usr/bin/ls /usr/lib/python3.11/site-packages/shiboken2/ /usr/bin/python | awk '{print $5}' | sort -u)
verbose_output "packages" "$packages"

# loop over each package
redundant_packages=()
for package in $packages; do
  dependent_packages=$(pactree -rl $package | tail -n +2)
  for p in $packages; do
    if echo "$dependent_packages" | grep -q "^$p\$"; then
      redundant_packages+=("$package")
    fi
  done
done
redundant_packages=$(printf "%s\n" "${redundant_packages[@]}" | sort -u)
verbose_output "redundant_packages" "$redundant_packages"
 
# Compute the set difference
top_level_packages=$(printf "$packages\n$redundant_packages\n$redundant_packages\n" | sort | uniq -u)
verbose_output "top_level_packages" "$top_level_packages"

# Print the top-level packages based on selected format
if $single_line; then
  echo "${top_level_packages[*]}" | awk '{ printf "%s ", $0 }'
  echo
else
  printf "%s\n" "${top_level_packages[@]}"
fi
