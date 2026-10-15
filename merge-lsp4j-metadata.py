#!/usr/bin/env python3
"""Merge classgraph-style LSP4J DTO reflection metadata into agent output.

Mirrors upstream apple/pkl-lsp's reflectionMetadataGenerator
(src/reflectionMetadataGenerator): the native-image tracing agent does not
exercise every LSP endpoint, so classes it never loads are absent from its
reflection metadata. Scanning the fat JAR for all org.eclipse.lsp4j classes and
registering them for reflection closes that gap.

Usage: merge-lsp4j-metadata.py <agent-json> <fat-jar> <output-json>
"""

import json
import sys
import zipfile

LSP4J_PACKAGE = "org.eclipse.lsp4j"
LSP4J_PATH = LSP4J_PACKAGE.replace(".", "/") + "/"


def lsp4j_class_names(jar_path):
    with zipfile.ZipFile(jar_path) as zf:
        entries = zf.namelist()
    names = set()
    for entry in entries:
        if not entry.startswith(LSP4J_PATH) or not entry.endswith(".class"):
            continue
        if entry.endswith("module-info.class") or entry.endswith("package-info.class"):
            continue
        names.add(entry[: -len(".class")].replace("/", "."))
    return sorted(names)


def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <agent-json> <fat-jar> <output-json>", file=sys.stderr)
        return 1

    agent_json, jar_path, output_json = sys.argv[1:4]

    with open(agent_json) as f:
        metadata = json.load(f)

    reflection = [
        elem
        for elem in metadata.get("reflection", [])
        if not (
            isinstance(elem, dict)
            and isinstance(elem.get("type"), str)
            and elem["type"].startswith(LSP4J_PACKAGE)
        )
    ]

    for name in lsp4j_class_names(jar_path):
        reflection.append(
            {
                "type": name,
                "allPublicConstructors": True,
                "allPublicFields": True,
                "allDeclaredFields": True,
                "allDeclaredConstructors": True,
            }
        )

    metadata["reflection"] = reflection

    with open(output_json, "w") as f:
        json.dump(metadata, f, indent=2)
        f.write("\n")

    return 0


if __name__ == "__main__":
    sys.exit(main())
