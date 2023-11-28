# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.4.0
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'vim' 'docker' 'rust' 'git' 'wget' 'unzip')
optdepends=('go: Go support')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7858c621c1cba5e90533894b8ce296789a5c3a6e4f7ca0a47e2a5bc347a69e54')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
