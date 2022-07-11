# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.352"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.352.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.352/flyctl_0.0.352_Linux_x86_64.tar.gz")
sha256sums=('42cb392c83732015df7a27e2cc00532a75e7829fe6300e6f5bebdbfe53d52156')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

