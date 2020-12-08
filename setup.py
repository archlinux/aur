import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="siiptool",
    version="0.7.7",
    description="Firmware and BIOS Utilities (FBU)",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/intel/iotg-fbu",
    packages=setuptools.find_packages(),
    scripts=[
        "siiptool/siip_sign.py",
        "siiptool/siip_stitch.py",
        "siiptool/subregion_capsule.py",
        "siiptool/subregion_sign.py",
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    package_data={
        'siiptool': ['thirdparty/Bin/*/*'],
    },
    include_package_data=True,
)
