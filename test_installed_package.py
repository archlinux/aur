import os
import subprocess

import pytest

DEPENDENCY_PATHS_PARAMS = [
    (
        "LD_LIBRARY_PATH=/usr/lib/eID_klient:/usr/lib",
        "/opt/eidklient-native/eID_Client",
        [],
        # $ ltrace -C eID_Client 2>&1 | cut -d \( -f 1 | awk '!x[$0]++'
        "QApplication::exec",
        [
            "/opt/eidklient-native/lib/libbotan-2.so.18",
            "/usr/lib/eID_klient/libCardAPI.so",
            "/usr/lib/eID_klient/libQt6Core.so.6",
            "/usr/lib/eID_klient/libQt6Widgets.so.6",
        ],
    ),
    (
        "LD_LIBRARY_PATH=/usr/lib/eID_klient:/usr/lib",
        "/opt/eidklient-native/VirtualKeyboard",
        [
            "1??NkU",
            "0??V?",
            "-1",
        ],
        "QApplication::exec",
        [
            "/opt/eidklient-native/lib/libbotan-2.so.18",
            "/usr/lib/eID_klient/libQt6Core.so.6",
            "/usr/lib/eID_klient/libQt6Widgets.so.6",
        ],
    ),
    (
        "LD_PRELOAD=/usr/lib/eID_klient/libpkcs11_x64.so",
        "/bin/true",
        [],
        "",
        [
            "/opt/eidklient-native/lib/libbotan-2.so.18",
            "/usr/lib/eID_klient/libCardAPI.so",
            "/usr/lib/eID_klient/libpkcs11_x64.so",
        ],
    ),
]


@pytest.mark.parametrize(
    "env_var, executable, arguments, breakpoint, expected_paths",
    DEPENDENCY_PATHS_PARAMS,
    ids=[
        f"{env_var} {executable}"
        for env_var, executable, _, _, _ in DEPENDENCY_PATHS_PARAMS
    ],
)
def test_dependency_paths(
    env_var,
    executable,
    arguments,
    breakpoint,
    expected_paths,
):
    """
    Tests that dependencies are loaded from the right paths.
    GDB is used so that dependencies loaded through dlopen() are considered too.
    """

    gdb_args = (
        ["gdb"]
        + ["--init-eval-command", "set debuginfod enabled off"]
        + ["--return-child-result"]
        + ["--args", executable, *arguments]
    )

    gdb_script = [
        f"set environment {env_var}",
    ]
    if breakpoint:
        gdb_script += [
            f"break {breakpoint}",
            "commands",
            "  info sharedlibrary",
            "  quit 0",
            "end",
        ]
    gdb_script += [
        "run",
    ]
    if not breakpoint:
        gdb_script += [
            "info sharedlibrary",
        ]
    gdb_script = "\n".join(gdb_script)

    gdb = subprocess.run(
        gdb_args,
        check=True,
        input=gdb_script,
        stdout=subprocess.PIPE,
        text=True,
    )

    actual_paths = sorted(
        path
        for line in gdb.stdout.splitlines()
        if line.startswith("0x")
        and (
            path := os.path.realpath(
                line.rsplit(maxsplit=1)[-1],
                strict=True,
            )
        ).startswith(
            (
                "/opt/eidklient-native/",
                "/usr/lib/eID_klient/",
            ),
        )
    )

    assert actual_paths == expected_paths
