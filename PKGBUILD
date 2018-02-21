# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver=0.6.0
pkgrel=2
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-npyscreen-git' 'sqlite' )
source=("https://github.com/hnicke/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')
install=sodalite.install

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    FAKE_ROOT=$pkgdir ./install
}
