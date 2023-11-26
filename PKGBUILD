# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.3.6
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'docker' 'rust' 'git' 'wget' 'unzip')
optdepends=('go: Go support')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4fa345d3e3ace8e06e33154fe28d6c51cabd13f1094de5af159e294b9ec61414')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
