# Maintainer: Dag Robole <dag.robole@gmail.com>
pkgname=fluxbox-style-numix
pkgver=20160820
pkgrel=1
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/numix4.zip")
md5sums=('a5d58ff46ef8da3d7ef8f586a11201f8')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/numix/* "${pkgdir}/usr/share/fluxbox/styles/numix"
}
