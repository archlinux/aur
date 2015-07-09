# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Rob Hunter <subrosa@github>

pkgname=weatherman
pkgver=1.2.2
pkgrel=3
pkgdesc="Display weather information from the command line."
arch=('any')
license=('custom')
depends=("curl")
url=("https://github.com/subrosa/weatherman")
source=("https://github.com/subrosa/$pkgname/archive/$pkgver.tar.gz")
md5sums=("5da26fa890238c0b2a2105d0ae43e9d5")

build() {
    true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 weatherman $pkgdir/usr/bin/weatherman
    install -Dm644 weatherman.1.gz $pkgdir/usr/share/man/man1/weatherman.1.gz
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
