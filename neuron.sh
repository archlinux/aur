#!/bin/bash

neuron_dir="$PWD"
args=()

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -d)
      neuron_dir="$(realpath "$2")"
      shift
      shift
      ;;
    *)
      args+=("$1")
      shift
      ;;
  esac
done

/opt/neuron-zettelkasten-bin/neuron -d "$neuron_dir" "${args[@]}"
