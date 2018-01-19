# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=work-hours-counter
pkgver=1.2
pkgrel=1
pkgdesc="Simple GUI work hours calculator written in Scala"
arch=('any')
url="https://github.com/YanDoroshenko/work-hours-counter"
license=('GPL')
depends=('java-environment')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname"-"$pkgver".jar" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".png" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".desktop")
sha256sums=('5b763602dec53bb7765139511f5e41b64773bbfeca3e01faf8a2b7034bb2a48a'
	    'd197ed8c0919d4ff60ddb19f9062ab6476a1370e8cb65f31bd44930c12af0926'
	    'caf3f0aa3d6e4fc09006a4ed1a485ad874a73c4019d40327f9c1cd46efbe866a')

package() {
    mkdir -p "$pkgdir"/usr/share/"$pkgname"
    mkdir -p "$pkgdir"/usr/share/applications

    install -Dm644 "$srcdir"/"$pkgname"-"$pkgver".jar "$pkgdir"/usr/share/"$pkgname"/
    install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/"$pkgname"/
    install -Dm755 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
