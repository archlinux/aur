# Maintainer: Jan Pawłowicz <jpawlowiczbusiness@gmail.com>
pkgname='mementomori'
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line live death counter"
arch=('any')
url="https://github.com/naujan/mementomori"
license=('MIT')
depends=('python' 'python-yaml' 'python-dateutil')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9e8cc610a522e05494e80235441f236ecc35688a1f9607c7fbbd07bb3a3b3f0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
