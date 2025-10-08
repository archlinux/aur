#!/usr/bin/env python3
"""
Berke Minecraft Launcher - Setup Script
"""

from setuptools import setup, find_packages
from version import get_version_info

# Get version information
version_info = get_version_info()

setup(
    name="berke-minecraft-launcher",
    version=version_info["version"],
    author=version_info["author"],
    author_email="berke3oruc@gmail.com",
    description="Advanced Minecraft launcher with mod support, skin management, and performance monitoring",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url=version_info["url"],
    license=version_info["license"],
    packages=find_packages(),
    py_modules=["berke_minecraft_launcher", "i18n", "version"],
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: End Users/Desktop",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Games/Entertainment",
        "Topic :: System :: Systems Administration",
    ],
    python_requires=">=3.8",
    install_requires=[
        "requests>=2.32.0",
        "rich>=14.1.0",
        "colorama>=0.4.6",
        "psutil>=7.1.0",
    ],
    entry_points={
        "console_scripts": [
            "berke-minecraft-launcher=berke_minecraft_launcher:main",
            "berkemc=berke_minecraft_launcher:main",
        ],
    },
    include_package_data=True,
    package_data={
        "": ["*.png", "*.txt", "*.md", "*.sh"],
    },
    zip_safe=False,
)
