from setuptools import setup, find_packages

setup(
    name="tchMaterial-parser",
    version="3.3.2",
    packages=find_packages(include=['src']),  # 声明 src 为包
    package_data={
        'src': [
            'favicon_223x223.png',
            'favicon_48x48.ico'
        ]
    },
    entry_points={
        'gui_scripts': [
            'tchMaterial-parser = src.main:main'
        ]
    },
    data_files=[
        ('share/applications', ['tchMaterial-parser.desktop']),
        ('share/pixmaps', ['src/favicon_223x223.png'])
    ],
    python_requires='>=3.6'
)
