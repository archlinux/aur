from distutils.core import setup

from setuptools import find_packages

with open('README.md') as f:
    readme = f.read()


setup(
    name='amdgpu_fan',
    version='PROJECTVERSION',
    packages=find_packages(),
    url='https://github.com/chestm007/amdgpu-fan',
    license='GPL-2.0',
    author='Max Chesterfield',
    author_email='chestm007@hotmail.com',
    maintainer='Filippo Roggi',
    maintainer_email='zzkw35@gmail.com',
    description='amdgpu fan controller',
    long_description=readme,
    install_requires=[
        'pyyaml',
        'numpy',
    ],
    entry_points="""
        [console_scripts]
        amdgpu-fan=amdgpu_fan.controller:main
    """,
)
