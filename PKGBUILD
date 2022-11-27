# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://download.huck.website"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
package() {
    cd "$srcdir" || exit
    make install DESTDIR="$pkgdir" 
}
sha256sums=('69ab2ee7c442dcdcde9e87871a352c50f089f2c960c9e8809f1ec071fc49012b')
