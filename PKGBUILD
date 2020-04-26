# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-chorus-lx
pkgver=1.4.2
pkgrel=2
pkgdesc="A Simple Algorithmic Chorus By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
md5sums=('5c80840920709455736f77ea8e390fd5')

package() {
  install -Dm755 ${srcdir}/Tal-Chorus-LX.so ${pkgdir}/usr/lib/vst/Tal-Chorus-LX.so
}
