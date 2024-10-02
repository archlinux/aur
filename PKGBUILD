# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=garden-devops-bin
pkgver=0.13.41
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
sha256sums=('e6d3368d5d6b2e34b5e5f9e9abd71a093c856ace52f0a3f43d118b597ed16650')

package() {
    cd linux-amd64
    install -Dm755 garden -t "$pkgdir/usr/bin"
}

