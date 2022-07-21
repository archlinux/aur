# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.357"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.357.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.357/flyctl_0.0.357_Linux_x86_64.tar.gz")
sha256sums=('228b97bad1f24e26be9be084c6e1bb92c0a55508a9d081ee48e0f4408c1c34c9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

