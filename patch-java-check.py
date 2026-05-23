#!/usr/bin/env python3
"""
Patch Screaming Frog SEO Spider to bypass Java vendor/version check.
This modifies the comparison method to always return success.
"""

import os
import sys
import zipfile


JAVA_CHECK_STRINGS = (
    b"java.vendor",
    b"Eclipse Adoptium",
    b"alert.java_environment.version.message",
)


def patch_class(data):
    """Patch the class to bypass Java vendor check."""

    # Find the method id927595243() which performs the check
    # The method contains: getstatic, ldc, invokevirtual equals, ifne, iconst_1, ireturn
    # We want to change the final iconst_1 to iconst_0 so it always returns success

    # Pattern: iconst_1 (0x04) followed by ireturn (0xAC)
    # This appears at the "error" return path
    old_pattern = bytes([0x04, 0xAC])  # iconst_1; ireturn - returns 1 (fail)
    new_pattern = bytes([0x03, 0xAC])  # iconst_0; ireturn - returns 0 (success)

    pos = data.find(old_pattern)
    if pos == -1:
        if data.find(new_pattern) != -1:
            print("Class already contains 'iconst_0; ireturn' - check is already patched")
            return data

        raise ValueError("Could not find 'iconst_1; ireturn' pattern in class")

    print(f"Found 'iconst_1; ireturn' at byte offset {pos} (0x{pos:04x})")

    # Replace
    data[pos : pos + 2] = new_pattern
    print(f"Replaced with 'iconst_0; ireturn' - check will now always pass")

    return data


def find_class_path(jar):
    """Find the obfuscated class that performs the Java environment check."""

    matches = []
    for item in jar.infolist():
        if not item.filename.endswith(".class"):
            continue

        data = jar.read(item.filename)
        if all(needle in data for needle in JAVA_CHECK_STRINGS):
            matches.append(item.filename)

    if len(matches) == 1:
        return matches[0]

    if len(matches) > 1:
        raise ValueError(
            "Found multiple Java check classes: " + ", ".join(matches)
        )

    raise ValueError("Could not find Java check class in JAR")


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <path-to-jar>")
        sys.exit(1)

    jar_path = sys.argv[1]

    if not os.path.exists(jar_path):
        print(f"Error: {jar_path} does not exist")
        sys.exit(1)

    # Read class from JAR
    with zipfile.ZipFile(jar_path, "r") as jar:
        class_path = find_class_path(jar)
        print(f"Found Java check class: {class_path}")
        class_data = bytearray(jar.read(class_path))

    print(f"Read class file: {len(class_data)} bytes")

    # Patch the class
    patched_data = patch_class(class_data)

    # Rewrite JAR
    print(f"Rewriting JAR...")
    with zipfile.ZipFile(jar_path, "r") as jar_in:
        with zipfile.ZipFile(jar_path + ".new", "w", zipfile.ZIP_DEFLATED) as jar_out:
            for item in jar_in.infolist():
                if item.filename == class_path:
                    jar_out.writestr(item, patched_data)
                    print(f"  Patched: {class_path}")
                else:
                    jar_out.writestr(item, jar_in.read(item.filename))

    os.replace(jar_path + ".new", jar_path)
    print(f"JAR patched successfully: {jar_path}")


if __name__ == "__main__":
    main()
