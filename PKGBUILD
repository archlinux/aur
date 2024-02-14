# Contributor: libele <libele@disroot.org>
# Contributor: Schroedinger <1181822466 at qq dot com>
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof
pkgver=20220202
pkgrel=1
pkgdesc='ad-hoc single file webserver; Web Offer One File'
arch=('any')
url="http://www.home.unix-ag.org/simon/$pkgname.html"
license=('GPL2')
depends=('python3')
source=(https://github.com/simon-budig/woof/archive/refs/tags/${pkgname}-${pkgver}.tar.gz)
b2sums=('2fff6fc05b5986787c09df4318ba0fbd20f3c33fd31fa5c054c31fd6131d37c08b9a9a5482a647d7b9b6d26565f85376bad11a638c3cc9c5c13321383c41d880')


package() {
    cd "$pkgname-$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
