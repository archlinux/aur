#! /usr/bin/env python3
import random
import argparse

responses = ["MDR", "XD", "LOL", "HAHAHA", "JAJAJA", "LMAO", "LMFAO", "IM DEAD", "55555", "X3", "ROFL", ":D", ":3"]

parser = argparse.ArgumentParser(description="Random laughing outputs")
parser.add_argument(
    "-n", "--number",
    type=int,
    default=None,
    help="Number of laughs to output"
)
parser.add_argument(
    "positional",
    nargs="?",
    type=int,
    default=None,
    help="Alternative positional number of laughs"
)

args = parser.parse_args()

# Use -n first, then positional, else default 1
num_outputs = args.number if args.number is not None else args.positional if args.positional is not None else 1

if num_outputs < 1:
    print("Number of laughs must be at least 1")
    exit(1)

for _ in range(num_outputs):
    print(random.choice(responses))
