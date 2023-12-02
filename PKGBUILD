# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=0.4.1
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'vim' 'docker' 'rust' 'git' 'wget' 'unzip' 'go')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9dfff7b4a2dac7e7be47890cee76fc5330e078cf32e4164b6b1330fac256d6b4')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
