# Maintainer: goetzc
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=6.0.4
pkgrel=2
pkgdesc="KDE Plasma 6 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL-2.0-or-later')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")
b2sums=('1e54faf316cf5820bd5103b82034931c9ad15538d95ac9962cb6a00268ae0363446276e398bd46c471b0b8236bcafe1cb69d316fd6f8a9fce5e31d5cc67cf70f')

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze/Breeze/" "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze_Light/Breeze_Light/" "$pkgdir/usr/share/icons/"
}
