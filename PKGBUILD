# Maintainer: Jasper Van der Jeugt <jasper@fugue.co>
pkgname=patat-bin
pkgver='0.8.2.5'
pkgrel=1
pkgdesc="Terminal-based presentations using Pandoc"
arch=('x86_64')
url="https://github.com/jaspervdj/patat"
license=('GPL2')
depends=('gmp' 'glibc')
makedepends=()
source=("https://github.com/jaspervdj/patat/releases/download/v0.8.2.5/patat-v0.8.2.5-linux-x86_64.tar.gz")
md5sums=('61ec305ab06f0453c072bd41d98423a8')
options=('!strip')

package() {
    local srcdir="patat-v$pkgver-linux-x86_64"

    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/patat" "$pkgdir/usr/bin/patat"

    mkdir -p "$pkgdir/usr/share/man/man1"
    cp "$srcdir/patat.1" "$pkgdir/usr/share/man/man1/patat.1"
}
