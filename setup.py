from setuptools import setup

readme = open("pyinputevent/README").read()
setup(name="PyInputEvent",
      version="0.1b0",
      description="PyInputEvent provides a python interface to Linux's input subsystem",
      url="https://github.com/rmt/pyinputevent.git",
      author="rmt",
      license="MIT",
      long_description=readme,
      packages=['pyinputevent']
)
