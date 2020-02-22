# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-hanken
pkgver=1.0
pkgrel=1
pkgdesc='Geometric and rounded sans-serif font'
arch=(any)
url="https://fontlibrary.org/en/font/hanken"
license=(OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/hanken/855de8cbbcb144bc29cdd2927821141f/hanken.zip")
sha256sums=('2362cf1b55acc527755e81214e08f12cb409ebf4ce9e76a6a5f822ef73216d4a')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL-FAQ.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
