# Contributor: Liang Wei <weiliang1503@yandex.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gwm
pkgver=0.8
pkgrel=1
epoch=
pkgdesc="A modern tiling windows manager for X11"
arch=('x86_64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL3')
depends=('bash' 'libx11')
source=("https://sourceforge.net/projects/gsmwm/files/$pkgname-$pkgver.tar.gz")
sha256sums=('b81b775f1d14df2253294423fcf5edd311626d1374792c5661f24e4a9a3dc816')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
