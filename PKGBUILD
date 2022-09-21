# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.3.4
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
install=aursh.install
BUILDENV+=('!check')
package() {
    cd "$srcdir" || exit
    make install DESTDIR="$pkgdir/" 
}
sha256sums=('a545cde61b64240d8933556be43a74196265ce264f13ebbaa9d79b618f6b2b9a')
