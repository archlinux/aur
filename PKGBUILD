# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=csdr-cwskimmer
pkgver=1.3
pkgrel=1
pkgdesc="CSDR-based CW skimmer."
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/csdr-cwskimmer"
license=('GPL3')
depends=('fftw' 'csdr')
makedepends=('git' 'make')
source=("$pkgname"::"git+https://github.com/luarvique/csdr-cwskimmer.git#tag=${pkgver}")
md5sums=('SKIP')


build() {
    cd "$srcdir/$pkgname"
	make all
}

package() {
	install -Dm 0755 "$srcdir/$pkgname/csdr-cwskimmer" "$pkgdir/usr/bin/csdr-cwskimmer"
}
