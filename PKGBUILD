pkgname=kumono-bin
pkgver=0.48.2
pkgrel=1
pkgdesc='Media ripper for coomer.st and kemono.cr'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver::$url/releases/download/$pkgver/kumono")
sha256sums=('80394383137e61994b6f88c95b13e822ba994aa008bc3cdebf72350144f1843c')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver" "$pkgdir/usr/bin/kumono"
}
