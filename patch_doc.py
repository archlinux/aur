import re
import sys
from os import path

src_dir = path.abspath(sys.argv[1])

def replace_en_readme_link(input_file, output_file):
    with open(input_file, 'r') as f:
        input_content = f.read()
    replaced_content = re.sub(r'(!?\[.*?\])\(./(.*?)\)', lambda s: f'{s.group(1)}({path.relpath(path.join(src_dir, s.group(2)), path.join(src_dir, "doc/en_us/"))})', input_content)
    with open(output_file, 'w') as f:
        f.write(replaced_content)

def replace_index_link(input_file):
    with open(input_file, 'r') as f:
        input_content = f.read()
    replaced_content = re.sub(r'\+ \[English\]\(../ReadMe.md\)', r'+ [English](./en_us/ReadMe.md)', input_content)
    with open(input_file, 'w') as f:
        f.write(replaced_content)

replace_en_readme_link(path.join(src_dir, 'ReadMe.md'), path.join(src_dir, 'doc/en_us/ReadMe.md'))
replace_index_link(path.join(src_dir, 'doc/index.md'))
