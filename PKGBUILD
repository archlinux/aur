# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-bangers
pkgver=2.100
pkgrel=1
_commit=7b1747307aeb617957a216213de28b14d3281d9d
pkgdesc='Comic books font with capital letters'
arch=(any)
url="https://fonts.google.com/specimen/Bangers"
_repo="https://github.com/googlefonts/bangers"
license=(OFL-1.1-no-RFN)
source=("Bangers-Regular-$pkgver.ttf::$_repo/raw/$_commit/fonts/ttf/Bangers-Regular.ttf"
        "OFL-$pkgver.txt::$_repo/raw/$_commit/OFL.txt")
sha256sums=('4160a7311de9342674cce9160cde9fcbb30f48190397d86ff1b70b455af65824'
            '630dd5a307c0657b094d324e069b390edf90182fe5003639e06c02a0e5769af7')

package() {
	install -Dm644 Bangers-Regular-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/Bangers-Regular.ttf"
	install -Dm644 OFL-$pkgver.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
