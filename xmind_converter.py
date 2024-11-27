#!/usr/bin/env python3

import xmindparser
import os
import sys
from pathlib import Path

def process_line(line):
    """Process a single line and convert to appropriate format"""
    stripped = line.strip()
    if not stripped:
        return ""

    # Extract the level and content
    level = 0
    while stripped.startswith('#'):
        level += 1
        stripped = stripped[1:]
    content = stripped.strip()

    # Format based on level
    if level == 1:  # h1
        return f"# {content}\n"
    elif level == 2:  # h2
        return f"## {content}\n"
    elif level == 3:  # h3 as bold text
        return f"**{content}**\n"
    elif level == 4:  # h4
        return f"- {content}\n"
    elif level == 5:  # h5
        return f"    - {content}\n"
    elif level == 6:  # h6
        return f"        - {content}\n"
    elif level == 7:  # h7
        return f"            - {content}\n"
    elif level == 8:  # h8
        return f"                - {content}\n"
    else:
        return line

def convert_xmind(input_file, output_file):
    try:
        # Parse XMind
        content = xmindparser.xmind_to_dict(input_file)
        if not content:
            return False

        # Open output file
        with open(output_file, 'w', encoding='utf-8') as f:
            def write_topic(topic, level=1):
                # Write title
                title = topic.get('title', '').strip()
                if title:
                    line = f"{'#' * level} {title}\n"
                    f.write(process_line(line))

                # Write note if exists
                if 'note' in topic and topic['note']:
                    f.write(topic['note'].strip() + '\n\n')

                # Process subtopics
                if 'topics' in topic:
                    for subtopic in topic['topics']:
                        write_topic(subtopic, level + 1)

            # Start processing from root
            write_topic(content[0]['topic'])

        return True

    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python script.py <source_directory> <output_directory>")
        return

    source_dir = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])

    if not source_dir.exists():
        print("Source directory does not exist")
        return

    output_dir.mkdir(parents=True, exist_ok=True)

    success = 0
    failed = 0

    for xmind_file in source_dir.glob('*.xmind'):
        output_file = output_dir / (xmind_file.stem + '.md')
        print(f"Converting: {xmind_file.name}")

        if convert_xmind(str(xmind_file), str(output_file)):
            print(f"Success: {xmind_file.name}")
            success += 1
        else:
            print(f"Failed: {xmind_file.name}")
            failed += 1

    print(f"\nDone! Successful: {success}, Failed: {failed}")

if __name__ == "__main__":
    main()
