# Maintainer: Jasper Van der Jeugt <m@jaspervdj.be>
pkgname=patat-bin
pkgver='0.10.1.0'
pkgrel=1
pkgdesc="Terminal-based presentations using Pandoc"
arch=('x86_64')
url="https://github.com/jaspervdj/patat"
license=('GPL2')
depends=('gmp' 'glibc')
makedepends=()
source=("https://github.com/jaspervdj/patat/releases/download/v$pkgver/patat-v$pkgver-linux-x86_64.tar.gz")
md5sums=('5d201b86c5a15499c88415eb5cf8df7d')
options=('!strip')

package() {
    local srcdir="patat-v$pkgver-linux-x86_64"

    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/patat" "$pkgdir/usr/bin/patat"

    mkdir -p "$pkgdir/usr/share/man/man1"
    cp "$srcdir/patat.1" "$pkgdir/usr/share/man/man1/patat.1"
}
