# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=plenv
pkgver=2.3.1
pkgrel=1
pkgdesc='Simple Perl version management'
arch=('any')
url='https://github.com/tokuhirom/plenv'
license=('GPL')
optdepends=('perl-build: To build perl')
depends=()
source=("https://github.com/tokuhirom/plenv/archive/${pkgver}.zip")
md5sums=('a5513465573a2d9374e2168cdb0dccbd')

package() {
    mkdir -p "${pkgdir?}"/{opt/plenv,usr/bin}
    cd "${srcdir?}/$pkgname-$pkgver" || return
    cp -a -- * "$pkgdir"/opt/plenv
    ln -s /opt/plenv/libexec/plenv "$pkgdir/usr/bin/plenv"
}
