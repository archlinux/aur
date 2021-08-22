# Maintainer: Alberto Vicente <odintdh at gmail dot com>
pkgname=indicator-extremecooling4linux
pkgver=0.1
pkgrel=1
pkgdesc="A desktop indicator for ExtremeCooling4Linux."
arch=("x86_64")
url="https://gitlab.com/OdinTdh/indicator-extremecooling4linux"
license=('GPL3')
depends=("extremecooling4linux" "libappindicator-gtk3" "libnotify")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/OdinTdh/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('13ef81283789282638a4d67b11be59d1815d00fdcf94234db81413a80b1b7a6d')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/pixmaps/
	mkdir -p $pkgdir/etc/xdg/autostart/
	mkdir -p $pkgdir/usr/share/icons/hicolor/symbolic/apps/
	make DESTDIR="$pkgdir" install
}
