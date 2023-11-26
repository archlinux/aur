# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.3.5
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'docker' 'rust' 'git' 'wget' 'unzip')
optdepends=('go: Go support')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('83275a04f592b4ca8b71b4dbf381643d9d1cadeec4ca34c384743731117462d0')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
