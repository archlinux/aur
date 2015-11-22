# Maintainer: luckdragon <f41c0r [/at\] cyb3r DOT space>

pkgname=logcat-colorize
pkgver=0.5
pkgrel=1
pkgdesc="A simple program that colorizes Android Debug Bridge (adb)'s logcat output on a terminal window."
url="https://bitbucket.org/brunobraga/logcat-colorize/overview"
depends=(boost-libs gcc-libs)
makedepends=('mercurial')
arch=('x86_64' 'i686')
license=('Apache')
source=('hg+https://bitbucket.org/brunobraga/logcat-colorize.git')
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/bin

  cd ${srcdir}/${pkgname}.git
  make 
  PREFIX=${pkgdir}/usr make install
}

# vim:set ts=2 sw=2 et:
