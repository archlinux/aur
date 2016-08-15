# Maintainer: Dag Robole <dag.robole@gmail.com>
pkgname=fluxbox-style-numix
pkgver=20160816
pkgrel=1
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/numix.zip")
md5sums=('227b50508708ea69425ce17f4bafe71a')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/numix/* "${pkgdir}/usr/share/fluxbox/styles/numix"
}
