pkgname=kumono-bin
pkgver=0.41.1
pkgrel=2
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono::$url/releases/download/$pkgver/kumono")
sha256sums=('54381c637da0d97dcd73ba3c733ab438a31da9142dee727b2348c93fd8990f9f')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 'kumono' -t "$pkgdir/usr/bin"
}
