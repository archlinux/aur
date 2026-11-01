"""Assert that the built CPython 3.15 interpreter uses the free-threaded ABI."""

import sys
import sysconfig


def main() -> None:
    assert sys.version_info[:2] == (3, 15), sys.version
    assert sysconfig.get_config_var("Py_GIL_DISABLED") == 1
    assert not sys._is_gil_enabled(), "The GIL must be disabled"
    assert sys.abiflags == "t", sys.abiflags
    assert sys.implementation.cache_tag == "cpython-315"
    assert (sysconfig.get_config_var("SOABI") or "").startswith("cpython-315t-")


if __name__ == "__main__":
    main()
