# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
# Upstream URL: https://bitbucket.org/obayhan/minidlnagui
#
# For improvements/fixes to this package and app please create and issue or send a pull request
# https://bitbucket.org/obayhan/minidlnagui

pkgname=minidlnagui
pkgver=0.9
pkgrel=1
pkgdesc='Graphical frontend to minidlna for standalone run'
arch=('any')
url='https://bitbucket.org/obayhan/minidlnagui'
license=('BSD')
depends=('python2' 'minidlna' 'wxpython' )
optdepends=()
makedepends=()
conflicts=()
source=("https://bitbucket.org/obayhan/minidlnagui/downloads/minidlnaGUI-${pkgver}.tar.gz")
sha256sums=('7b346174fb932cd5488ae0e19d582c40c5d31251ebb8bc1188f4f15f24a8dca4')

package() {
  mkdir ${pkgdir}/usr/
  cp -rf ${srcdir}/usr/* ${pkgdir}/usr/
}