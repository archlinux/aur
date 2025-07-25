pkgname=kumono-bin
pkgver=0.48.0
pkgrel=1
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver::$url/releases/download/$pkgver/kumono")
sha256sums=('1d944579a8e50479febc6a334049daf15d59675e1e16b1d3f3de08fa384be24a')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver" "$pkgdir/usr/bin/kumono"
}
