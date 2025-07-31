pkgname=kumono-bin
pkgver=0.53.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver::$url/releases/download/$pkgver/kumono")
sha256sums=('ba9aa285fc17fa3f85bf23fdc469767db0198306c1a96fa1e1378974ae35a4b3')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver" "$pkgdir/usr/bin/kumono"
}
