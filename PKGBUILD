# Maintainter: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2020.2
pkgrel=1
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/toolchain-builder'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2020-2/FRC-2020-Linux-Toolchain-7.3.0.tar.gz")
sha512sums=('04e0d590f61db71e27d08eb9834d6a65c35a80b5ad7f429a6976353ee8b402972d036fe696f432d48b219aa9929e7daa9dc3213e202fb2e02167657cf48ac243')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/frc2020/roborio/* $pkgdir/usr
  rm -r $pkgdir/usr/include
  rm -r $pkgdir/usr/share/{info,man}
}
