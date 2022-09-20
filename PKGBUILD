# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.3.1
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
    cd "$pkgname-$pkgver" || exit
    make install DESTDIR="$srcdir/" 
}
sha256sums=('cd3d8cfb7bf81d500857d94e594823307649aa30835cec13174e105bddef71a3')
