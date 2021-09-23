import os
from setuptools import setup


setup(
    name="Emote",
    version=os.environ.get("EMOTE_VERSION"),
    packages=["emote"],
    setup_requires=["setuptools"],
    entry_points={
        "gui_scripts": [
            "emote = emote.__init__:main",
        ]
    },
    install_requires=[
        "pygobject",
        "manimpango"
    ],
    package_data={
        "emote": [
            "static/*"
        ]
    },
    data_files=[("share/applications", ["snap/gui/emote.desktop"]),
                ("share/icons", ["snap/gui/emote.svg"])]
)
