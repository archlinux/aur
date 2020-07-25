# Maintainer: Oliver Hattshire <hattshire at gmail dot com>
# Font Author: 0xcf843ecf802c722f434d56 <nathanwoodformal at gmail dot com>

_fontname=InupiaqNumbers
_basename=inupiaqnumbers
_pkgbase=ttf-${_basename}
pkgname=${_pkgbase}
pkgver=0.2
pkgrel=1
pkgdesc='A font for displaying Inupiaq numerals. It uses from U+E5A0 to U+E5B3.'
url="https://github.com/0xcf843ecf802c722f434d56/${_basename}"
license=('MIT')
arch=('any')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=("${_pkgbase}-git")
source=("https://raw.githubusercontent.com/0xcf843ecf802c722f434d56/${_fontname}/${pkgver}/${_fontname}.ttf")
sha1sums=('SKIP')

package() {
  cd "${srcdir}/"
  install -Dm644 $srcdir/$_fontname.ttf $pkgdir/usr/share/fonts/TTF/$_fontname.ttf
}
