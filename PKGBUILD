# Maintainer: goetzc
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=6.3.3
pkgrel=1
pkgdesc="KDE Plasma 6 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL-2.0-or-later')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")
b2sums=('b49cd5ca0e8d94582b723513ef61ef16ee5e6aff802873558814801e41431cb562a6e1b4f3a46f3544b2723ec920b9ea7b0a48accf088cf2e141f77b8e89e471')

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze/Breeze/" "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze_Light/Breeze_Light/" "$pkgdir/usr/share/icons/"
}
