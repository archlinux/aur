# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=5.0.4
pkgrel=1
pkgdesc="A git hook test runner for rust programer" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rustup' 'wget' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2f8edba77db8a9f4a406a9b305aed59d8b03f55abcf80f639b76050a217b5990')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
