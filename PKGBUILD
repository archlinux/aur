# Maintainer: Jan Pawłowicz <jpawlowiczbusiness@gmail.com>
pkgname='mementomori'
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line live death counter"
arch=('any')
url="https://github.com/naujan/mementomori"
license=('MIT')
depends=('python' 'python-yaml' 'python-dateutil')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2521de6793747e34f946ce9eca134fcf0a86eeae1d71eed76f8cc68a30168f7f')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
