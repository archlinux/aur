#!/usr/bin/env python3
"""
Validate a Pi skill directory for Agent Skills + README requirements.

Usage:
  python3 scripts/validate_skill.py <skill_directory>

Requires PyYAML. On Arch Linux, install it with:

  sudo pacman -S python-yaml
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

import yaml

MAX_NAME_LENGTH = 64
MAX_DESCRIPTION_LENGTH = 1024

ALLOWED_FRONTMATTER_FIELDS = {
    "name",
    "description",
    "license",
    "compatibility",
    "metadata",
    "allowed-tools",
    "disable-model-invocation",
}

NAME_PATTERN = re.compile(r"^[a-z0-9-]+$")
FRONTMATTER_PATTERN = re.compile(r"^---\n(.*?)\n---", re.DOTALL)
INSTALLATION_HEADING = re.compile(r"^#{1,6}\s+installation\b", re.IGNORECASE)


def read_frontmatter(skill_md: Path) -> tuple[dict | None, str | None]:
    content = skill_md.read_text()
    if not content.startswith("---"):
        return None, "No YAML frontmatter found"

    match = FRONTMATTER_PATTERN.match(content)
    if not match:
        return None, "Invalid frontmatter format"

    try:
        frontmatter = yaml.safe_load(match.group(1))
    except yaml.YAMLError as exc:
        return None, f"Invalid YAML in frontmatter: {exc}"

    if not isinstance(frontmatter, dict):
        return None, "Frontmatter must be a YAML mapping"

    return frontmatter, None


def validate_readme(readme_path: Path) -> tuple[list[str], list[str]]:
    errors: list[str] = []
    warnings: list[str] = []

    if not readme_path.exists():
        return ["README.md not found"], warnings

    content = readme_path.read_text().strip()
    if not content:
        return ["README.md is empty"], warnings

    lines = readme_path.read_text().splitlines()
    installation_index = None
    for idx, line in enumerate(lines):
        if INSTALLATION_HEADING.match(line.strip()):
            installation_index = idx
            break

    if installation_index is None:
        errors.append("README.md is missing an Installation section")
    else:
        summary_lines = [
            line.strip()
            for line in lines[:installation_index]
            if line.strip() and not line.strip().startswith("#")
        ]
        if not summary_lines:
            warnings.append("README.md has no summary text before Installation")

    return errors, warnings


def validate_frontmatter(frontmatter: dict, skill_dir: Path) -> tuple[list[str], list[str]]:
    errors: list[str] = []
    warnings: list[str] = []

    keys = set(frontmatter.keys())
    unknown = sorted(keys - ALLOWED_FRONTMATTER_FIELDS)
    if unknown:
        warnings.append(f"Unknown frontmatter field(s): {', '.join(unknown)}")

    name = frontmatter.get("name")
    if not isinstance(name, str) or not name.strip():
        errors.append("Missing or invalid 'name' in frontmatter")
    else:
        normalized = name.strip()
        parent_dir = skill_dir.name
        if normalized != parent_dir:
            errors.append(
                f"Frontmatter name '{normalized}' does not match directory '{parent_dir}'"
            )
        if len(normalized) > MAX_NAME_LENGTH:
            errors.append(
                f"Name is too long ({len(normalized)}). Max {MAX_NAME_LENGTH}."
            )
        if not NAME_PATTERN.match(normalized):
            errors.append(
                "Name must be lowercase letters, digits, and hyphens only"
            )
        if normalized.startswith("-") or normalized.endswith("-"):
            errors.append("Name must not start or end with a hyphen")
        if "--" in normalized:
            errors.append("Name must not contain consecutive hyphens")

    description = frontmatter.get("description")
    if not isinstance(description, str) or not description.strip():
        errors.append("Missing or invalid 'description' in frontmatter")
    else:
        desc = description.strip()
        if len(desc) > MAX_DESCRIPTION_LENGTH:
            errors.append(
                f"Description is too long ({len(desc)}). Max {MAX_DESCRIPTION_LENGTH}."
            )

    allowed_tools = frontmatter.get("allowed-tools")
    if allowed_tools is not None and not isinstance(allowed_tools, str):
        warnings.append("'allowed-tools' should be a space-delimited string")

    compatibility = frontmatter.get("compatibility")
    if compatibility is not None and not isinstance(compatibility, str):
        warnings.append("'compatibility' should be a string")

    license_value = frontmatter.get("license")
    if license_value is not None and not isinstance(license_value, str):
        warnings.append("'license' should be a string")

    metadata = frontmatter.get("metadata")
    if metadata is not None and not isinstance(metadata, dict):
        warnings.append("'metadata' should be a mapping")

    disable_invocation = frontmatter.get("disable-model-invocation")
    if disable_invocation is not None and not isinstance(disable_invocation, bool):
        warnings.append("'disable-model-invocation' should be a boolean")

    return errors, warnings


def validate_skill(skill_path: Path) -> tuple[list[str], list[str]]:
    errors: list[str] = []
    warnings: list[str] = []

    if not skill_path.exists():
        return [f"Skill directory not found: {skill_path}"], warnings

    if not skill_path.is_dir():
        return [f"Skill path is not a directory: {skill_path}"], warnings

    skill_md = skill_path / "SKILL.md"
    if not skill_md.exists():
        errors.append("SKILL.md not found")
        return errors, warnings

    frontmatter, frontmatter_error = read_frontmatter(skill_md)
    if frontmatter_error:
        errors.append(frontmatter_error)
        return errors, warnings

    fm_errors, fm_warnings = validate_frontmatter(frontmatter, skill_path)
    errors.extend(fm_errors)
    warnings.extend(fm_warnings)

    readme_errors, readme_warnings = validate_readme(skill_path / "README.md")
    errors.extend(readme_errors)
    warnings.extend(readme_warnings)

    return errors, warnings


def main() -> None:
    if len(sys.argv) != 2:
        print("Usage: scripts/validate_skill.py <skill_directory>")
        sys.exit(1)

    skill_path = Path(sys.argv[1]).resolve()
    errors, warnings = validate_skill(skill_path)

    if warnings:
        print("Warnings:")
        for warning in warnings:
            print(f"  - {warning}")
        print()

    if errors:
        print("Errors:")
        for error in errors:
            print(f"  - {error}")
        sys.exit(1)

    print("Skill is valid!")
    sys.exit(0)


if __name__ == "__main__":
    main()
