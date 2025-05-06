import ast
import os
import sys
import pkgutil
import importlib.util
from collections import defaultdict
import argparse

def get_standard_library_modules():
    """
    Get a set of standard library modules for the current Python environment.
    """
    stdlib_modules = set(sys.builtin_module_names)  # Built-in modules
    stdlib_path = os.path.dirname(os.__file__)  # Path to the standard library

    for _, module_name, _ in pkgutil.iter_modules([stdlib_path]):
        stdlib_modules.add(module_name)

    # Use sys.stdlib_module_names if available (Python 3.10+)
    if hasattr(sys, "stdlib_module_names"):
        stdlib_modules.update(sys.stdlib_module_names)

    return stdlib_modules

def get_python_modules_in_directory(directory):
    """
    Get a set of module names that exist within the given directory.
    """
    module_names = set()
    for root, _, files in os.walk(directory):
        relative_root = os.path.relpath(root, directory).replace(os.sep, '.')
        for file in files:
            if file.endswith(".py") and not file.startswith("__"):
                module_name = file[:-3]  # Remove .py extension
                if relative_root != ".":
                    module_name = f"{relative_root}.{module_name}"
                module_names.add(module_name)
    return module_names

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
            if node.module and node.level == 0:  # Ignore relative imports
                imported_modules[node.module].add(file_path)
    return imported_modules

def get_filtered_imports(directory, stdlib_modules):
    """
    Recursively scan a directory for Python scripts and track imported modules,
    filtering out those that refer to local files in the same module.
    """
    all_imports = defaultdict(set)
    module_names = get_python_modules_in_directory(directory)

    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".py"):
                file_path = os.path.join(root, file)
                imported_modules = get_imported_modules_with_files(file_path)
                for module, files in imported_modules.items():
                    if module not in stdlib_modules and module not in module_names:
                        all_imports[module].update(files)
    return all_imports

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Scan a directory for external dependencies.")
    parser.add_argument("directory", help="The directory to scan for Python imports.")
    args = parser.parse_args()

    stdlib_modules = get_standard_library_modules()
    imported_modules_with_files = get_filtered_imports(args.directory, stdlib_modules)

    # Print the results
    for module, files in imported_modules_with_files.items():
        print(f"Module: {module}")
        print(f"  Imported in:")
        for file in sorted(files):
            print(f"    {file}")
