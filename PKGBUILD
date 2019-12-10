# Maintainer: Igor Wong <983 at protonmail dot com>
gccver=49
pkgname=gcc-arm-none-eabi-bin-$gccver
pkgver=4.9_2015_q3_update
pkgrel=2
pkgdesc="GNU Tools for ARM Embedded Processors 4.9"
arch=('x86_64')
depends=('lib32-glibc')
url="https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update"
source=("https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2")
license=('custom')
options=(!strip staticlibs)
sha256sums=('c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab')

package() {
  mkdir -p $pkgdir/usr/local/arm
  cd $srcdir
  cp -a gcc* $pkgdir/usr/local/arm
}
