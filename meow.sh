#!/bin/bash
python_script=$(cat <<'EOF'
import random

SEPARATOR = '[catseparator]'
FILE = '/etc/meow/cats.txt'

# read the file
with open(FILE, 'r') as f:
    content = f.read()

# split all the cats using the separator var
cats = content.split(SEPARATOR)

# say nuh uh to extra spaces
cats = [cat.rstrip() for cat in cats]

random_cat = random.choice(cats)
print(random_cat, end='')
EOF
)

ascii_cat=$(python3 -c "$python_script")
echo "$ascii_cat"
