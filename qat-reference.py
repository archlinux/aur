"""Run pinned upstream QAT code as an independent, same-platform test oracle."""

import importlib.util
from pathlib import Path
import sys

import onnxsim


def apply_reference(label, *args, **kwargs):
    if label not in {"before_minibatch", "before_activation"}:
        raise ValueError(label)
    directory = Path(__file__).with_name("qat-reference-sources")
    modules = {}
    for stem in ("backend", "qat_graph", "graph_grad", "qat"):
        path = directory / f"qat-reference-{label}-{stem}.py"
        name = f"onnxsim._reference_{label}_{stem}"
        spec = importlib.util.spec_from_file_location(name, path)
        module = importlib.util.module_from_spec(spec)
        sys.modules[name] = module
        spec.loader.exec_module(module)
        modules[stem] = module

    # These helpers were imported at module scope. Pair each historical QAT
    # implementation with its own graph-builder and backend APIs.
    replacements = {stem: module for stem, module in modules.items() if stem != "qat"}
    for module in modules.values():
        for stem, dependency in replacements.items():
            if stem in vars(module):
                setattr(module, stem, dependency)

    attributes = {stem: getattr(onnxsim, stem) for stem in replacements}
    imports = {stem: sys.modules["onnxsim." + stem] for stem in replacements}
    try:
        for stem, module in replacements.items():
            setattr(onnxsim, stem, module)
            sys.modules["onnxsim." + stem] = module
        return modules["qat"].apply_qat(*args, **kwargs)
    finally:
        for stem in replacements:
            setattr(onnxsim, stem, attributes[stem])
            sys.modules["onnxsim." + stem] = imports[stem]
        for module in modules.values():
            sys.modules.pop(module.__name__, None)
