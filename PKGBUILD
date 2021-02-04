# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.172"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("-0.0.172.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.172/flyctl_0.0.172_Linux_x86_64.tar.gz")
sha256sums=('25e12aefb7bfbf0214b69b87a652e4ebc9f90033c422ba11fde945fdf072b9d5')

package() {
    mkdir -p "/usr/bin"
    install -m755 flyctl "/usr/bin"
}