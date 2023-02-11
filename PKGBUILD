# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=martoc
pkgver=0.2.1
pkgrel=2
epoch=
pkgdesc="Generate TOC for Audio CDs"
arch=("x86_64")
url="https://code.ott.net/martoc/"
license=("GPL3")
groups=()
depends=("taglib" "ffmpeg" "normalize" )
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("martoc-${pkgver}.tar.gz::https://code.ott.net/martoc/downloads/martoc-${pkgver}.tar.gz")
sha256sums=("e0f5ddd034975bba51f905cd34c29c776ff65c464a9dcc2f5aa98e56a36194f0")
noextract=()
md5sums=()
validpgpkeys=()

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
