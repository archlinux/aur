# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=0.4.2
pkgrel=1
pkgdesc="An rust program to run tests with git hooks" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rustup' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3ed6557b5b8630e3191fa779c8a24c2d55a466db6f0b854b41fe1bd9bc993244')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
