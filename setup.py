from setuptools import setup

setup(
    name="i3map",
    version="1.0.0",
    description="Generate a table of i3wm keybindings from your config file",
    author="Hanashiko",
    author_email="hlichisper@gmail.com",
    url="https://github.com/hanashiko/i3map",
    py_modules=['i3map'],
    entry_points={
        "console_scripts": [
            "i3map=i3map:main",
        ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Environment :: X11 Applications",
        "Topic :: Utilities",
    ],
    python_requires=">=3.6",
)
