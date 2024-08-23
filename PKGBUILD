# Maintainer: goetzc
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=6.1.4
pkgrel=2
pkgdesc="KDE Plasma 6 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL-2.0-or-later')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")
b2sums=('0506fa24e3c98dd76cb5432d18f0a959e9c35f908a3057a611faea95a445ed81049c24c955b87153e973dc96fb25e1dd0ebbb6a7207e547b725743025cc43fee')

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze/Breeze/" "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/breeze-${pkgver}/cursors/Breeze_Light/Breeze_Light/" "$pkgdir/usr/share/icons/"
}
