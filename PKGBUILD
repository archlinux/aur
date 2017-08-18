# Maintainter: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=20170817
pkgrel=1
pkgdesc="Metapackage for installing all of the FIRST Robotics Competition C/C++ build system components"
arch=('any')
url='https://github.com/wpilibsuite/'
license=('GPL')
groups=('frc-toolchain')
depends=('arm-frc-linux-gnueabi-gcc'
         'arm-frc-linux-gnueabi-frcmake-hg'
         'arm-frc-linux-gnueabi-gdb')
optdepends=('arm-frc-linux-gnueabi-wpilib: for building robot code without Eclipse plugins')
conflicts=('frc-2017')
replaces=('frc-2017')
source=()

pkgver() {
  date +%Y%m%d
}
