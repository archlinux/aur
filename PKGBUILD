pkgname=kumono-bin
pkgver=0.33.3
pkgrel=2
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("catbox::$url/releases/download/$pkgver/kumono")
sha256sums=('SKIP')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 'kumono' -t "$pkgdir/usr/bin"
}
