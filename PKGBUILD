# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=work-hours-counter
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple GUI work hours calculator written in Scala"
arch=('any')
url="https://github.com/YanDoroshenko/work-hours-counter"
license=('GPL')
depends=('java-environment')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname"-"$pkgver".jar" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".png" "https://github.com/YanDoroshenko/"$pkgname"/raw/master/target/"$pkgname".desktop")
sha256sums=('0be093cc006fac7c799b40aebe7a79efdec2c6cdcb6948718da32924249a0feb'
	    'f0c23b2576f205ada6a016076123013b88c34382a006086b32b244a5278d95c4'
	    '291081cdf76ab1e38b2892cfe2e8838670a38ba6ac9000e6c3c92551346e54b3')

package() {
    mkdir -p "$pkgdir"/usr/share/"$pkgname"
    mkdir -p "$pkgdir"/usr/share/applications

    install -Dm644 "$srcdir"/"$pkgname"-"$pkgver".jar "$pkgdir"/usr/share/"$pkgname"/
    install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/"$pkgname"/
    install -Dm755 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
