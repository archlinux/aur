# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.201"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.201.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.201/flyctl_0.0.201_Linux_x86_64.tar.gz")
sha256sums=('0de71d571770b4818fc07759c4b57ca96ec20643332240c6177a7c288d52a236')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}