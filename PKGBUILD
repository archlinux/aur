# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=wcurl
pkgver=2025.05.26
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://github.com/curl/wcurl/'
license=("LicenseRef-curl")
depends=(curl sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82')

package() {
    cd "$srcdir/wcurl-${pkgver}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    install -Dm644 wcurl.1 "$pkgdir/usr/share/man/man1/wcurl.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
