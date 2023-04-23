# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=matlab-meta
pkgver=9.14.0.2239454
pkgrel=1
pkgdesc='Meta package for MATLAB dependecies'
arch=(x86_64)
license=(None)
url='https://www.mathworks.com'
# Some of the dependencies probably are not needed.
# If you play around with them and find which one can be removed,
# please contact the maintainers.
# For a list of possible dependencies, see the package `namcap` and here:
# https://hub.docker.com/r/mathworks/matlab-deps/dockerfile.
depends=(
  'abseil-cpp'
  'c-ares'
  'embree'
  'gtk2'
  'gtk3'
  'hunspell'
  'lib32-glibc'
  'libdbus'
  'libnet'
  'libraw'
  'libsndfile'
  'libuv'
  'libxcrypt-compat'
  'libxss'
  'make'
  'minizip'
  'nss'
  'qt5-xmlpatterns'
  'tbb'
  'unixodbc'
)
# We should check even these ones.
# GCC: https://www.mathworks.com/support/requirements/supported-compilers.html
optdepends=(
  'cuda'
  'java-runtime: Java support'
  'zsh'
  'openal: for Orbisnap'
  'openssl-1.0: needed by MATLAB Client for MATLAB Production Server'
  'python: needed by MATLAB Client for MATLAB Production Server'
  'python2: needed by MATLAB Client for MATLAB Production Server'
)
depends+=(
  'glu'
  'portaudio'
  'qt5-svg'
  'qt5-webkit'
  'xerces-c'
)
