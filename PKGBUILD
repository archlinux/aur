# Maintainer: Zeeshan Alam <zeeshantechnical9128@gmail.com>
#Contributor: Tomáš Mládek <t@mldk.cz>

pkgname=supertag-appimage
pkgbase=supertag-appimage
pkgver=0.1.4
pkgrel=1
pkgdesc="A tag-based filesystem written in Rust."
arch=('x86_64')
url="https://github.com/amoffat/supertag"
license=('AGPL 3.0')
conflicts=('supertag')
source=("${url}/releases/download/v${pkgver}/supertag-x86_64.AppImage")
sha256sums=('c67d9f3d04df5ddf80426297026047bdaccb73483e476548564862224d753328')
options=(!strip)

package() {
	install -D -v -T "supertag-x86_64.AppImage" $pkgdir/usr/bin/tag
}
