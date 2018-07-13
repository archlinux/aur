# Maintainer: Ben Oliver <ben@bfoliver.com>
pkgname=buku-dmenu
pkgver=v0.1.0
pkgrel=3
pkgdesc="Access buku bookmarks from dmenu."
arch=('any')
url="https://gitlab.com/benoliver999/buku-dmenu"
license=('GPL3')
depends=('buku' 'dmenu' 'bash' 'coreutils' 'sed' 'findutils')
source=("https://gitlab.com/benoliver999/buku-dmenu/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0f06fa0a2e6a7bfd7fb76e72a1304bd1')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 buku-dmenu "$pkgdir/usr/bin/buku-dmenu"
}
