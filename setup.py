from pybind11.setup_helpers import Pybind11Extension
from setuptools import setup


setup(
    name="kealib",
    version="0.1",
    description="Access to parts of kealib not exposed by GDAL",
    long_description="",
    author="Sam Gillingham",
    author_email="gillingham.sam@gmail.com",
    packages=["kealib"],
    package_dir={"kealib": "python"},
    ext_package="kealib",
    ext_modules=[
        Pybind11Extension(
            name="extrat",
            sources=["python/extrat.cpp"],
            include_dirs=["python/include"],
            libraries=["kea"],
        ),
        Pybind11Extension(
            name="fakegdal",
            sources=["python/fakegdal.cpp"],
            libraries=["kea"],
        ),
    ],
    license="LICENSE.txt",
    url="https://github.com/ubarsc/kealib",
    classifiers=[
        "Intended Audience :: Developers",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.11",
    ],
    cmdclass={"cxx_std": 17},
    zip_safe=False,
    python_requires=">=3.7",
)
