#!/usr/bin/python

import sys

import frida


def main() -> None:
    if len(sys.argv) != 2:
        raise RuntimeError("expected package version argument")

    expected_version = sys.argv[1]
    if frida.__version__ != expected_version:
        raise RuntimeError(
            f"unexpected frida version: {frida.__version__!r}, expected {expected_version!r}"
        )

    manager = frida.get_device_manager()
    if manager is None:
        raise RuntimeError("frida.get_device_manager() returned None")

    print(f"frida-python-runtime={frida.__version__}")


if __name__ == "__main__":
    main()
