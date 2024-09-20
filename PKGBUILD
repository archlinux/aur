# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=garden-devops-bin
pkgver=0.13.40
pkgrel=1
pkgdesc="DevOps automation tool for developing Kubernetes apps."
arch=("x86_64")
provides=("garden-devops")
url="https://garden.io/"
license=("MPL-2.0")
depends=("git")
makedepends=()
optdepends=()
options=("!strip")
install="garden.install"
source=("https://download.garden.io/core/$pkgver/garden-$pkgver-linux-amd64.tar.gz")
sha256sums=('9c989a366b8e05894792fc89341d1ddf670b8ad54347e23e685973f5e3682d33')

package() {
    cd linux-amd64
    install -Dm755 garden -t "$pkgdir/usr/bin"
}

