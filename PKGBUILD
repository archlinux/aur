# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=garden-devops-bin
pkgver=0.13.39
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
sha256sums=('00a0f704e927e59e6d4a943abcc7ee803fb9b8222eb728a344601647cd3a66bd')

package() {
    cd linux-amd64
    install -Dm755 garden -t "$pkgdir/usr/bin"
}

