import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="passtools",
    version="0.1",
    author="Mahmoud Ramadan",
    author_email="mahmoud.r.hashad@gmail.com",
    description="A small script that help you generate password and check for the password strength",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/Ta180m/2048",
    py_modules=[ "main" ],
    classifiers=[
        'Environment :: Console',
        'Intended Audience :: End Users/Desktop',
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: OS Independent",
    ],
    entry_points={
        'console_scripts': [
            'passtools = main:main',
        ],
    },
    install_requires=[ 'pyperclip', 'requests' ]
)
