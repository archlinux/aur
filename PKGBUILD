# Maintainer: goetzc
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=6.0.1
pkgrel=1
pkgdesc="KDE Plasma 6 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL-2.0-or-later')
depends=('libxcursor')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")
b2sums=('d3c1c5f179e31d62d5a313fe5b283a167eb96ed12d7b2181a5a2182ee8d005f71c202526c3fd521f558b209762c409ece7d929d00d631c14811691fe12ec6b31')

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze/Breeze/" "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze_Light/Breeze_Light/" "$pkgdir/usr/share/icons/"
}
