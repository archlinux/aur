# Maintainer: Jan Pawłowicz <jpawlowiczbusiness@gmail.com>
pkgname='mementomori'
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line live death counter"
arch=('any')
url="https://github.com/naujan/mementomori"
license=('MIT')
depends=('python' 'python-yaml' 'python-dateutil' 'python-rich')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('942f7acca757fd7dbe3d2691936ef7d1c957932300d3341b10d428c28cd3ac83')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
