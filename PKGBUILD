# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-reverb4
pkgver=2.2.6
pkgrel=2
pkgdesc="A Simple Algorithmic Reverb By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('f7c07bf461491ac95b4fc8655ae49d45')

package() {
  install -Dm755 ${srcdir}/Tal-Reverb-4.so ${pkgdir}/usr/lib/vst/Tal-Reverb-4.so
}
