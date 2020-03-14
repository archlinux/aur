# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-reverb4
pkgver=2.2.5
pkgrel=1
pkgdesc="A Simple Algorithmic Reverb By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('GPL2')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('3d71c01260ea3329d6c6e88807fb710c')

package() {
  install -Dm755 ${srcdir}/Tal-Reverb-4.so ${pkgdir}/usr/lib/vst/Tal-Reverb-4.so
}
