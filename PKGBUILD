# Maintainer: goetzc
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=6.4.3
pkgrel=1
pkgdesc="KDE Plasma 6 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL-2.0-or-later')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")
b2sums=('2cae42b6dc4aa86735b62716bf373f10a5fae8ea9bc525fc64e842f3df00a5c57eafdb2a8b8f7e163b09e70871160fdf3a705fb88d3a7c592b73402f6bfa4845')

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze/Breeze/" "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze_Light/Breeze_Light/" "$pkgdir/usr/share/icons/"
}
