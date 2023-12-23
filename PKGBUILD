# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=0.4.1
pkgrel=1
pkgdesc="An rust program to run tests with git hooks" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rust' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3eb63abef4fe7f959f7da6d7fa2ab351f3fcb54a6eb4c5b17957e9c0078d26ec')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
