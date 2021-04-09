# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.207"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.207.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.207/flyctl_0.0.207_Linux_x86_64.tar.gz")
sha256sums=('90e4d47aebbf04e7537a534920e64268a2c1c8a907a476aeb8f787248ebcac93')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}