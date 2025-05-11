#!/usr/bin/env python3
"""
i3map - Generate a table of i3wm keybinding from your config file
"""

import os
import re
import sys
import argparse
from collections import defaultdict
from pathlib import Path

class I3ConfigParser:
    def __init__(self, config_path=None):
        """Initialize with optional config path or use default."""
        self.config_path = config_path or os.path.expanduser("~/.config/i3/config")
        self.bindings = []
        self.undefined = []
        self.variables = {}
        self.parse_config()

    def parse_config(self):
        """Patse the i3 config file to extract keybindings."""
        try:
            with open(self.config_path, 'r') as file:
                content = file.read()

            self._extract_variables(content)

            binding_pattern = re.compile(r'bind(?:sym|code)\s+(?:--release\s+)?([^\s]+)\s+(.+)')

            for line in content.split('\n'):
                line = line.strip()
                if not line or line.startswith('#'):
                    continue

                match = binding_pattern.match(line)
                if match:
                    key, action = match.groups()

                    key = self._replace_variables(key)

                    if '$' in key:
                        self.undefined.append((key, action))
                    else:
                        mods = []
                        main_key = ""
                        key_parts = key.split('+')
                        for part in key_parts:
                            if part in ['Mod1','Mod4','Shift','Control','Ctrl','Alt']:
                                if part == 'Mod4':
                                    mods.append('Super')
                                elif part == 'Mod1':
                                    mods.append('Alt')
                                else:
                                    mods.append(part)
                            else:
                                main_key = part

                        self.bindings.append({
                            'modifiers':mods,
                            'key':main_key,
                            'action':action
                        })
        except FileNotFoundError:
            print(f"Error: Config file not found at {self.config_path}")
            sys.exit(1)

    def _extract_variables(self, content):
        """Extract all variable definitions from the config."""
        variable_pattern = re.compile(r'set\s+\$([a-zA-Z0-9_]+)\s+(.+)')
        
        for line in content.split('\n'):
            line = line.strip()
            if not line or line.startswith('#'):
                continue

            match = variable_pattern.match(line)
            if match:
                var_name, var_value = match.groups()
                self.variables[var_name] = var_value.strip()

    def _replace_variables(self, text):
        """Replace all variables in a text with their values."""
        for var_name, var_value in self.variables.items():
            text = text.replace(f"${var_name}", var_value)
        return text

    def _is_variable_defined(self, content, variable_ref):
        """Check if a variable is defined in the config."""
        var_names = re.findall(r'\$([a-zA-Z0-9_]+)', variable_ref)
        for var_name in var_names:
            if var_name not in self.variables:
                return False
        return True

    def format_binding(self, binding):
        """Format a bindings table with optional sorting."""
        mods = "+".join(binding['modifiers'])
        if mods: 
            return f"{mods}+{binding['key']}"
        return binding['key']
    
    def display_bindings(self, sort_by='none'):
        """Display the bindings table with optional sorting."""
        if sort_by == 'modifier':
            sorted_bindings = sorted(self.bindings, key=lambda b: '+'.join(b['modifiers']))
        elif sort_by == 'key':
            sorted_bindings = sorted(self.bindings, key=lambda b: b['key'])
        elif sort_by == 'action':
            sorted_bindings = sorted(self.bindings, key=lambda b: b['action'])
        else:
            sorted_bindings = self.bindings

        max_binding_length = max([len(self.format_binding(b)) for b in sorted_bindings], default=0)

        for binding in sorted_bindings:
            formatted = self.format_binding(binding)
            print(f"{formatted:<{max_binding_length + 4}}→ {binding['action']}")

        if self.undefined:
            print("\nUndefined bindings:")
            for key, action in self.undefined:
                print(f"{key:<{max_binding_length + 4}}→ {action} (UNDEFINED)")

def main():
    parser = argparse.ArgumentParser(description="Display i3wm keybindings in a human-readable format")
    parser.add_argument('--config', '--c', help='Path to i3 config file')
    parser.add_argument('--sort', '--s', choices=['modifier','key','action','none'],
                        default='none', help='Sort bindings by modifier, key, or action')

    args = parser.parse_args()

    i3_parser = I3ConfigParser(args.config)
    i3_parser.display_bindings(args.sort)

if __name__ == "__main__":
    main()
