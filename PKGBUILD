# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=wcurl
pkgver=2024.12.08
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://github.com/curl/wcurl/'
license=("LicenseRef-curl")
depends=(curl sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c0615b2c5d6b21da79ff559e75452197330d18449085a18e05f4b623b144a94')

package() {
    cd "$srcdir/wcurl-${pkgver}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    install -Dm644 wcurl.1 "$pkgdir/usr/share/man/man1/wcurl.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
