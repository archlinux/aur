# Maintainter: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2019.3
pkgrel=1
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/toolchain-builder'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/toolchain-builder/releases/download/v2019-3/FRC-2019-Linux-Toolchain-6.3.0.tar.gz")
sha512sums=('4121c199e289b5f1bec153c61586e7aea712355485c16ce6a75a6e235940033bf733ed28bf8cecde77d341587e7deec1ccf154b3122cf66f58ed3429a3830909')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/frc2019/roborio/* $pkgdir/usr
  rm -r $pkgdir/usr/include
  rm -r $pkgdir/usr/share/{info,man}
}
