# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=wcurl
pkgver=2025.02.24
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://github.com/curl/wcurl/'
license=("LicenseRef-curl")
depends=(curl sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('640319b7a3dfd693a4a513ae603539b9e0632a706ed75f969765f5341f1a14c7')

package() {
    cd "$srcdir/wcurl-${pkgver}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    install -Dm644 wcurl.1 "$pkgdir/usr/share/man/man1/wcurl.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
