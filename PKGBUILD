# Maintainer: Brendan Szymanski <bscubed@pm.me>
pkgname=devtest
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool for AUR package maintainers to easily manage and test multiple packages"
arch=('any')
url="https://github.com/bscubed/devtest"
license=('GPL3')
depends=('devtools')
makedepends=('git')
optdepends=('ccache: For ccache integration')
source=("git+https://github.com/bscubed/devtest.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    make PREFIX=usr DESTDIR="$pkgdir" install
}
