# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.189"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.189.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.189/flyctl_0.0.189_Linux_x86_64.tar.gz")
sha256sums=('8ba5e337f8d3eaff59a1a265e5c273667a1a322cfeca77e258ce5e34bf7dcd04')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}