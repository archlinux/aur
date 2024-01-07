# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=5.0.5
pkgrel=1
pkgdesc="A git hook test runner for rust programer" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rustup' 'wget' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0f7f1bd13b4369e752b58b41d4940c0e6e2584a2433e42764814f2308679a84')

package() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
    cargo install --path .
}
