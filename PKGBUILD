# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=wcurl
pkgver=2025.04.20
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://github.com/curl/wcurl/'
license=("LicenseRef-curl")
depends=(curl sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c40ccf365febca9115611db271b2d6705728fc7efb297df3f2eba70d3a97fa03')

package() {
    cd "$srcdir/wcurl-${pkgver}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    install -Dm644 wcurl.1 "$pkgdir/usr/share/man/man1/wcurl.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
