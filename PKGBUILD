# Maintainer: Jan Pawłowicz <jpawlowiczbusiness@gmail.com>
pkgname='mementomori'
pkgver=0.2.1
pkgrel=1
pkgdesc="A command-line live death counter"
arch=('any')
url="https://github.com/naujan/mementomori"
license=('MIT')
depends=('python' 'python-yaml' 'python-dateutil' 'python-rich')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46af32cfb5b77641ca72434df14587df7785f5f9b936f35bc4dabe9b7124faee')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
