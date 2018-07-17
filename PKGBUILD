# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=plenv
pkgver=2.3.0
pkgrel=1
pkgdesc='Simple Perl version management'
arch=('any')
url='https://github.com/tokuhirom/plenv'
license=('GPL')
optdepends=('perl-build: To build perl')
depends=()
source=("https://github.com/tokuhirom/plenv/archive/${pkgver}.zip")
md5sums=('a71ef9947e134d31e5a024f56483c2c9')

package() {
    mkdir -p "${pkgdir?}"/{opt/plenv,usr/bin}
    cd "${srcdir?}/$pkgname-$pkgver" || return
    cp -a -- * "$pkgdir"/opt/plenv
    ln -s /opt/plenv/libexec/plenv "$pkgdir/usr/bin/plenv"
}
