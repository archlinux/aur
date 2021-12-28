#from distutils.core import setup
from setuptools import setup, find_packages

#This is a list of files to install, and where
#(relative to the 'root' dir, where setup.py is)
#You could be more specific.

files = ["movies-dl/*"]


setup(name = "movies-dl",
    version = "1.0",
    description = "The python program that lets you download movies for free.",
    author = "matthew",
    author_email = "matthewriel63@gmail.com",
    url = "https://github.com/Kungger-git/movies-dl.git",
    #Name the folder where your packages live:
    #(If you have other packages (dirs) or modules (py files) then
    #put them into the package directory - they will be found 
    #recursively.)
    #packages = ['PID1'],
    packages=find_packages(),
    #'package' package must contain files (see list above)
    #I called the package 'package' thus cleverly confusing the whole issue...
    #This dict maps the package name =to=> directories
    #It says, package *needs* these files.
    package_data = {'movies-dl' : files },
 
    #setup_requires=[
    #	'PyGithub'
    #],   
    
    install_requires=[
        'requests',
        'bs4',
        'colorama',
        'qbittorrent',
        'qbittorrent-api'
    ],
    #Some addiional script
    #scripts = ["bin/funniest-joke"],
    long_description = """Really long text here.""" 
    #
    #This next part it for the Cheese Shop, look a little down the page.
    #classifiers = []     
) 
