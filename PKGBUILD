# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>

pkgname=ufetch
pkgver=1.0.8777d23
pkgrel=1
pkgdesc="Info script for minimal *nix systems."
arch=('i686' 'x86_64')
url="https://github.com/jschx/${pkgname}"
license=('GPL')
provides=('ufetch')
source=("https://raw.githubusercontent.com/jschx/ufetch/master/ufetch-arch")
md5sums=('SKIP')

package() {
install -Dm755 "$srcdir/ufetch-arch" "$pkgdir/usr/bin/ufetch"
}


