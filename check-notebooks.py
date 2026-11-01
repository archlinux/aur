"""Execute upstream notebook checks against the installed wheel, without nbdev."""
import ast
import importlib
import json
from pathlib import Path
import re

# Export cells are the source for the already-built modules. Load those modules
# instead. Only nbdev documentation/export helpers and index rendering are omitted.
notebooks = {
    "00_basic.ipynb": "basic",
    "02_english.ipynb": "english",
    "03_international.ipynb": "international",
    "04_indic_normalizer.ipynb": "indic",
    "05_multilingual.ipynb": "multilingual",
    "06_evaluation.ipynb": "evaluation",
}
for filename, module_name in notebooks.items():
    module = importlib.import_module("whisper_normalizer." + module_name)
    namespace = dict(vars(module))
    count = assertions = 0
    for index, cell in enumerate(json.loads((Path("nbs") / filename).read_text())["cells"]):
        if cell["cell_type"] != "code":
            continue
        source = "".join(cell["source"])
        if re.search(r"^\s*#\s*\|\s*export\b", source, re.M):
            continue
        if re.search(r"^\s*(import nbdev\b|from nbdev\.|show_doc\()", source, re.M):
            continue
        tree = ast.parse(source)
        if not tree.body:
            continue
        assertions += sum(isinstance(node, ast.Assert) for node in ast.walk(tree))
        exec(compile(tree, f"{filename}:cell-{index}", "exec"), namespace)
        count += 1
    assert count > 0 and assertions > 0, filename
    print(f"{filename}: {count} upstream cells, {assertions} assertion statements passed")
