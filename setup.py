import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="$pkgname",
    version="$pkgver",
    author="Dummerle",
    author_email="--",
    description="$pkgdesc",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="$url",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
    ],
    install_requires=[
        "requests",
        "legendary-gl",
        "Pillow",
        "PyQt5",
    ],
    entry_points={
        "console_scripts": [
            "rare = Rare.Main:main",
        ],
    },
    package_data={
        "": ["Styles/*"]
    }
)
