# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail com>

pkgname=kscript
pkgver=1.6.0
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('custom')
depends=('kotlin')
_source_url="https://raw.githubusercontent.com/holgerbrandl/${pkgname}/v${pkgver}"
source=("${_source_url}/kscript" "${_source_url}/README.md" "${_source_url}/LICENSE.txt")
sha256sums=('fb43043a60be53f3d8e3cf93d173fb9119c87e9ba89e3b0cdb02029826149ccc'
            'd1c0c387aa6f3781da1c84b567637fe889374068cb1efa838b1568d8e9570846'
            '9f17c220a84297bff2720e11849ab0eacfdb564f5e6b7f1e1d768619787bf2d9')

package() {
    cd "${srcdir}"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
