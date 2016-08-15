# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-jet-gray
pkgver=20160816
pkgrel=1
pkgdesc="Fluxbox style for Jet-Gray and Zukitwo Dark"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/Jet-Gray.zip")
md5sums=('182a66f5e619fd507f08f5c5e9111d48')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/Jet-Gray"
  cp -r ${srcdir}/Jet-Gray/* "${pkgdir}/usr/share/fluxbox/styles/Jet-Gray"
}

