from setuptools import setup


setup(
    name="Emote",
    packages=["emote"],
    setup_requires=["setuptools"],
    entry_points={
        "gui_scripts": [
            "emote = emote.__init__:main",
        ]
    },
    install_requires=[
        "manimpango",
        "setproctitle",
        "dbus-python",
    ],
    # This is relative to the emote package
    package_data={"emote": ["static/*"]},
    # Unlike these, which are relative to setup.py
    data_files=[
        ("share/applications", ["static/emote.desktop"]),
        ("share/icons/hicolor/scalable/apps", ["static/emote.svg"]),
    ],
)
