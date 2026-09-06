# Maintainer: aksr <aksr88 at gmail dot com>
_pkgname=Isabella
pkgname=otf-isabella
pkgdesc='A font based on the calligraphic hand used in the Isabella Breviary, made around 1497, in Holland.'
arch=('any')
pkgver=1.202
pkgrel=2
url='http://www.thibault.org/fonts/isabella/'
license=('OFL-1.1' 'LGPL-2.1')
makedepends=('xorg-mkfontscale')
source=("http://www.thibault.org/fonts/isabella/${_pkgname}-${pkgver}-src.tar.gz")
md5sums=('f5c22b69e2673581587ce11d69f74556')
sha1sums=('5cf6d74bee0baf789237782e4ffc83dc5e6b23e3')
sha256sums=('af388b94605fa719cb58d64b8b967afc17ca500b85858f60bd3b5c6d11040a31')
b2sums=('6a248297522e5a3a6dfbdbab684c8ffb9cda14b0ab61168428070459a3021718c2e073f144bdcdcabffdb268bbd82d2a9d3ad2cba90d3627b566509d0d85d8cb')

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 Isabella.otf $pkgdir/usr/share/fonts/OTF/Isabella.otf
	install -D -m644 README.txt $pkgdir/usr/share/doc/${pkgname}/README.txt
	install -D -m644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/OFL.txt
	install -m644 COPYING.LIB $pkgdir/usr/share/licenses/${pkgname}/COPYING.LIB
}
