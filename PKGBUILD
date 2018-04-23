# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=work-hours-counter
pkgver=1.3
pkgrel=1
pkgdesc="Simple GUI work hours calculator written in Scala"
arch=('any')
url="https://github.com/YanDoroshenko/work-hours-counter"
license=('GPL')
depends=('java-environment')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname"-"$pkgver".jar" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".png" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".desktop")
sha256sums=('fb8334239f8ece3d0c9396139c806b19715c24718c7a54870f5754b4199cd9cf'
	    'd197ed8c0919d4ff60ddb19f9062ab6476a1370e8cb65f31bd44930c12af0926'
	    'fec5c630742435168215f203548d160daa526bcf13cc3d12c31bf42db46f625d')

package() {
    mkdir -p "$pkgdir"/usr/share/"$pkgname"
    mkdir -p "$pkgdir"/usr/share/applications

    install -Dm644 "$srcdir"/"$pkgname"-"$pkgver".jar "$pkgdir"/usr/share/"$pkgname"/
    install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/"$pkgname"/
    install -Dm755 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
