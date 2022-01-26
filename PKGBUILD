# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.289"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.289.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.289/flyctl_0.0.289_Linux_x86_64.tar.gz")
sha256sums=('ca867aaee629326cb50b6c02dda811062820a8cb91de4590eb038922b2b35a75')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

