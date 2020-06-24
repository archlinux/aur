
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-kwin-decoration
pkgver=1.0
pkgrel=0
pkgdesc="Contemporary KWin window decoration"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('gplv3')
depends=('kwin')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/contemporary-kwin/archive/v1.0.tar.gz')
sha256sums=('a63bf7e701098f4c98786ab0792a249addcf2705b9d926e392155bb6097b8d51')

package() {
	mkdir -p "$pkgdir/usr/share/aurorae/themes/"
	cp -r "contemporary-kwin-$pkgver/Contemporary"* "$pkgdir/usr/share/aurorae/themes/"
}
