# Maintainer: Colin Woodbury <colin@fosskers.ca>

_pkgname=garden
pkgname=${_pkgname}-devops-bin
pkgver=0.13.35
pkgrel=1
pkgdesc="DevOps automation tool for developing Kubernetes apps."
arch=("x86_64")
provides=("${_pkgname}-devops")
url="https://garden.io/"
license=("MPL-2.0")
options=("!strip")
depends=()
makedepends=()
optdepends=()
source=("https://download.garden.io/core/$pkgver/garden-$pkgver-linux-amd64.tar.gz")
sha256sums=('e24183d0906b82f83dd72e8b650cd1a62b6406a71f83bd6edc7d1e4a2ec21b3e')

package() {
    cd linux-amd64
    install -Dm755 garden -t "$pkgdir/usr/bin"
}
