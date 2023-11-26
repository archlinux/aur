# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.3.8
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'vim' 'docker' 'rust' 'git' 'wget' 'unzip')
optdepends=('go: Go support')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9fed9b0236ac0f5d25c8f179776ea7f9508d89b7b745bc083267fafbc084c813')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
