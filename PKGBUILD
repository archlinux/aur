# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=work-hours-counter
pkgver=1.1
pkgrel=1
pkgdesc="Simple GUI work hours calculator written in Scala"
arch=('any')
url="https://github.com/YanDoroshenko/work-hours-counter"
license=('GPL')
depends=('java-environment')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname"-"$pkgver".jar" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".png" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".desktop")
sha256sums=('649aca71ac4c39d3b912e3e8dbebeca6ee4c70ac8ec31dfcccf2b0ce758a7d3e'
	    'd197ed8c0919d4ff60ddb19f9062ab6476a1370e8cb65f31bd44930c12af0926'
	    '3fee7877ba9235a7a25f3bdfec72c21d27ace889546c5c4a8f2733fb51464ba2')

package() {
    mkdir -p "$pkgdir"/usr/share/"$pkgname"
    mkdir -p "$pkgdir"/usr/share/applications

    install -Dm644 "$srcdir"/"$pkgname"-"$pkgver".jar "$pkgdir"/usr/share/"$pkgname"/
    install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/"$pkgname"/
    install -Dm755 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
