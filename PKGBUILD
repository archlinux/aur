# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
# Upstream URL: https://bitbucket.org/obayhan/minidlnagui
#
# For improvements/fixes to this package and app please create and issue or send a pull request
# https://bitbucket.org/obayhan/minidlnagui

pkgname=minidlnagui
pkgver=0.9
pkgrel=3
pkgdesc='Graphical frontend to minidlna for standalone run'
arch=('any')
url='https://bitbucket.org/obayhan/minidlnagui'
license=('BSD')
depends=('python2' 'minidlna' 'wxpython' )
optdepends=()
makedepends=()
conflicts=()
source=("https://bitbucket.org/obayhan/minidlnagui/downloads/minidlnaGUI-${pkgver}.tar.gz")
sha256sums=('cf6a77ee1f285f7961b287c176a0abb3e8524f731bb458193f8ef63b492e1f7a')

package() {
  mkdir ${pkgdir}/usr/
  cp -rf ${srcdir}/usr/* ${pkgdir}/usr/
}