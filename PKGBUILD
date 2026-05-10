# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=martoc
pkgver=0.3.0
pkgrel=1
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
sha256sums=("47ce9bb68a1310837b5fe55015a1000570db00f43376330dc82ecbc78a1bdaae")
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
