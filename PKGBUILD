# Maintainer: Antonio Bonifati <antonio[dot]bonifati(SLUG)gmail[stitch]com>
# Contributor: Franklyn Tackitt <franklyn+aur@tackitt.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail.com>

_pkgname=phantomjs
_pkgver=2.1.3
pkgname=${_pkgname}-bin
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API (official static binary)"
url="http://www.phantomjs.org/"
license=("BSD")
arch=('x86_64')
depends=('fontconfig' 'icu55')
conflicts=('phantomjs')
provides=('phantomjs')
options=('!strip')
source=("https://github.com/ariya/phantomjs/releases/download/${_pkgver}/${_pkgname}")
md5sums=('4c5fd62ccc91c482f2151f435cf57e6b')

package() {
  install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/phantomjs"
}
