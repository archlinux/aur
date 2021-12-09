# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=jgd-black
pkgver=12_09_21
pkgrel=1
pkgdesc="Black and gray GTK theme collection (GTK 3.20+)"
arch=('any')
url="http://www.jasong-designs.com/2017/02/04/jgd-black-gtk3/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'ttf-dejavu: font support' 'xfce4: optional desktop environment for xfwm')
changelog=
source=("https://github.com/jgpws/jgd-black/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R JGD-Black "$pkgdir/usr/share/themes"
}

sha256sums=('23431cd4d04f664f2c208ee4501e46d3026e1a024205de59fcaa0ac61d3ec0d9')
