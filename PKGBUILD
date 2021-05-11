# Maintainer: Niclas Meyer <niclas at countingsort dot com>

pkgname=project-init
pkgver=3.1.19
pkgrel=2
pkgdesc="Quickly initialize projects from a template."
provides=('project-init')
conflicts=('project-init')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/vmchale/project-init"
source=("${pkgname}::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('1391119ebe306f3e0129f17a3c4d899d')

build() {
    return 0
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=nightly cargo install --no-track --locked --root="$pkgdir/usr"
}
