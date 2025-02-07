import ast
import os
import sys
import pkgutil
from collections import defaultdict

def get_standard_library_modules():
    """
    Get a set of standard library modules for the current Python environment.
    """
    stdlib_modules = set(sys.builtin_module_names)  # Built-in modules
    stdlib_path = os.path.dirname(os.__file__)  # Path to the standard library

    for _, module_name, is_pkg in pkgutil.iter_modules([stdlib_path]):
        stdlib_modules.add(module_name)
    return stdlib_modules

def get_imported_modules_with_files(file_path):
    """
    Extract imported modules from a Python script and associate them with the file.
    """
    with open(file_path, "r", encoding="utf-8") as f:
        try:
            tree = ast.parse(f.read(), filename=file_path)
        except SyntaxError:
            print(f"Syntax error in {file_path}, skipping.")
            return {}

    imported_modules = defaultdict(set)
    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            for alias in node.names:
                imported_modules[alias.name].add(file_path)
        elif isinstance(node, ast.ImportFrom):
            if node.module:
                imported_modules[node.module].add(file_path)
    return imported_modules

def get_all_imports_with_files(directory, stdlib_modules):
    """
    Recursively scan a directory for Python scripts and track imported modules with file paths.
    """
    all_imports = defaultdict(set)
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".py"):
                file_path = os.path.join(root, file)
                imported_modules = get_imported_modules_with_files(file_path)
                for module, files in imported_modules.items():
                    if module not in stdlib_modules:
                        all_imports[module].update(files)
    return all_imports

# Example usage
directory_path = "open_webui/"
stdlib_modules = get_standard_library_modules()
imported_modules_with_files = get_all_imports_with_files(directory_path, stdlib_modules)

# Print the results
for module, files in imported_modules_with_files.items():
    print(f"Module: {module}")
    print(f"  Imported in:")
    for file in sorted(files):
        print(f"    {file}")
