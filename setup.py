"""from setuptools import setup, find_packages

setup(
    name="tchMaterial-parser",
    version="3.0",
    py_modules=["src.main"],
    entry_points={
        'console_scripts': [
            'tchMaterial-parser = src.main:main'
        ]
    },
    data_files=[
        ('share/applications', ['./tchMaterial-parser.desktop']),
        ('share/pixmaps', ['src/favicon_223x223.png'])
    ]
)
"""
"""from setuptools import setup
import os

# 定义资源路径
desktop_file = "tchMaterial-parser.desktop"
icon_src = os.path.join("src", "favicon_223x223.png")

setup(
    name="tchMaterial-parser",
    version="3.0",
    packages=[],
    py_modules=[],  # 禁用自动包发现
    entry_points={
        'gui_scripts': [
            'tchMaterial-parser = src.main:main'
        ]
    },
    data_files=[
        ('share/applications', [desktop_file]),
        ('share/pixmaps', [icon_src])
    ],
    options={
        'build_scripts': {
            'executable': '/usr/bin/python'  # 确保使用系统Python
        }
    }
)"""
from setuptools import setup, find_packages

setup(
    name="tchMaterial-parser",
    version="3.0",
    packages=find_packages(include=['src']),  # 声明 src 为包
    package_data={
        'src': [
            'favicon_223x223.png',
            'favicon_48x48.ico'
        ]
    },
    entry_points={
        'gui_scripts': [
            'tchMaterial-parser = src.main:main'  # 正确引用包内模块
        ]
    },
    data_files=[
        ('share/applications', ['tchMaterial-parser.desktop']),
        ('share/pixmaps', ['src/favicon_223x223.png'])
    ],
    python_requires='>=3.6'
)
