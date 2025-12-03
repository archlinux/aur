# -*- mode: python ; coding: utf-8 -*-

a = Analysis(
    ["main.py"],
    pathex=[
        '/usr/lib'
    ],
    binaries=[],
    datas=[("icon.ico", "."), ("data.json", ".")],
    hiddenimports=[
        "tiktoken_ext.openai_public",
        "tiktoken_ext",
        "PySide6",
        "PySide6.QtCore",
        "PySide6.QtGui",
        "qfluentwidgets",
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)

exclude_prefix = [
    "PySide6/Qt6Pdf",
    "PySide6/Qt6Network",
    "PySide6/QtNetwork",
    "PySide6/Qt6VirtualKeyboard",
    "PySide6/Qt6Qml",
    "PySide6/Qt6Quick",
    "PySide6/Qt6OpenGL",
    "PySide6/Qt6QmlModels",
    "PySide6/translations",
]


def should_include(t):
    return not any(t[0].startswith(prefix) for prefix in exclude_prefix)


a.binaries = list(filter(should_include, a.binaries))
a.datas = list(filter(should_include, a.datas))

pyz = PYZ(a.pure)


exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name="sakura_launcher",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,  # https://pyinstaller.org/en/stable/usage.html#using-upx
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
