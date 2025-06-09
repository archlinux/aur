#!/usr/bin/env python3
"""
Generate stacktraverse.c - Stack traversal functions for libexecinfo

This script generates C code with switch statements that use GCC's
__builtin_return_address() and __builtin_frame_address() functions
to traverse the call stack up to a specified depth.

The generated functions work around the limitation that these builtins
only accept compile-time constants as arguments.
"""

import argparse
import sys
from typing import TextIO

PROLOGUE = '''#include <stddef.h>

#include "stacktraverse.h"

void *
get{name}addr(int level)
{{
    switch(level) {{'''

BODY_RETURN = '''    case {case}: {{
        void *fp = __builtin_frame_address({addr});
        if (!fp) return NULL;
        return __builtin_return_address({addr});
    }}'''
BODY_FRAME = '    case {case}: return __builtin_frame_address({addr});'

EPILOGUE = '''    default: return NULL;
    }
}'''

DEFAULT_MAXDEPTH = 128

def generate_function(name: str, maxnum: int, output: TextIO) -> None:
    """
    Generate a single stack traversal function.
    Args:
        name: Function type ('return' or 'frame')
        maxnum: Maximum stack depth to support
        output: Output file handle
    """
    print(PROLOGUE.format(name=name), file=output)
    for i in range(maxnum):
        if name == "return":
            print(BODY_RETURN.format(case=i, addr=i + 1), file=output)
        else:
            print(BODY_FRAME.format(case=i, addr=i + 1), file=output)
    print(EPILOGUE, file=output)

def main() -> int:
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description='Generate stacktraverse.c for libexecinfo',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument(
        '--max-depth', '-d',
        type=int,
        default=DEFAULT_MAXDEPTH,
        help='Maximum stack traversal depth'
    )

    parser.add_argument(
        '--output', '-o',
        type=argparse.FileType('w'),
        default=sys.stdout,
        help='Output file (default: stdout)'
    )

    args = parser.parse_args()

    # Validate depth
    if args.max_depth <= 0:
        print("Error: max-depth must be positive", file=sys.stderr)
        return 1

    if args.max_depth > 1024:
        print("Warning: Large max-depth may cause compilation issues",
              file=sys.stderr)

    try:
        # Generate both functions
        generate_function("return", args.max_depth, args.output)
        print(file=args.output)  # Empty line separator
        generate_function("frame", args.max_depth, args.output)

        if args.output != sys.stdout:
            print(f"Generated stacktraverse.c with depth {args.max_depth}")

        return 0

    except Exception as e:
        print(f"Error generating code: {e}", file=sys.stderr)
        return 1

    finally:
        if args.output != sys.stdout:
            args.output.close()

if __name__ == '__main__':
    sys.exit(main())