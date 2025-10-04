#!/bin/bash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

lune run "$script_dir/../share/blink/blink.luau"
