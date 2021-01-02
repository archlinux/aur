# Maintainer: Tomáš Mládek <t@mldk.cz>
pkgname=supertag
pkgver="0.1.3"
pkgrel="2"
pkgdesc="A tag-based filesystem."
arch=('x86_64')
url="https://github.com/amoffat/supertag/"
license=('AGPL 3.0')
source=("${url}/releases/download/v${pkgver}/supertag-x86_64.AppImage")
sha256sums=('f50378f171f4a64b21b499cb73f56303ee3f52ae2cf21abfc4166e35e395c2a4')
options=(!strip)

package() {
	install -D -v -T "supertag-x86_64.AppImage" $pkgdir/usr/bin/tag
}
