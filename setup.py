from setuptools import setup, find_packages


setup(
    name="nautilus-file-explorer",
    version="1.0.0",
    description="Explorador de archivos gráfico estilo Nautilus con controles de sistema",
    long_description=open("README.md", "r", encoding="utf-8").read() if os.path.exists("README.md") else "",
    long_description_content_type="text/markdown",
    author="Rodopqsi",
    author_email="rodolfo.tavera@tecsup.edu.pe",
    url="https://github.com/Rodopqsi/nautilus-file-explorer.git",
    packages=find_packages(),
    py_modules=["nautilus_explorer"],
    entry_points={
        "console_scripts": [
            "nautilus-explorer=nautilus_explorer:main",
        ],
    },
    install_requires=[
        "PyGObject>=3.30.0",
    ],
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: End Users/Desktop",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Desktop Environment :: File Managers",
    ],
    python_requires=">=3.8",
)