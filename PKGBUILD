# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.3.7
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'vim' 'docker' 'rust' 'git' 'wget' 'unzip')
optdepends=('go: Go support')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dbf6fc25f16d4b36f3d6a66939efb9d878e64b8527feeb7df038119bbfb7e5c4')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
