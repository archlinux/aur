#!/usr/bin/env python3

import sys

BEER = r"""
       .  .  .
     .  .  .  .
   _ _ _ _ _ _ _
  |             |
  | ~ ~ ~ ~ ~ ~ |___
  | ~ ~ ~ ~ ~ ~ |   )
  | ~ ~ ~ ~ ~ ~ |  /
  | ~ ~ ~ ~ ~ ~ | /
  |_____________|/
      | | | |
     _| |_| |_
    (_________)
"""


def main():
    if len(sys.argv) == 1 or (len(sys.argv) > 1 and sys.argv[1] == "beer"):
        print(BEER)
        return 0
    print("Usage: beer [beer]", file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())