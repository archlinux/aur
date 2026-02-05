# Maintainer: Carsten König <carstenkoenig92@gmail.com>
pkgname=elasticvue-bin
pkgver=1.13.0
pkgrel=2
pkgdesc="A free and open source gui for elasticsearch"
arch=('x86_64')
url="https://github.com/cars10/elasticvue"
license=('MIT')
provides=('elasticvue')
conflicts=('elasticvue')

source=("elasticvue-${pkgver}::https://github.com/cars10/elasticvue/releases/download/v${pkgver}/elasticvue"
        "elasticvue.desktop"
        "blue_96.png::https://raw.githubusercontent.com/cars10/elasticvue/master/src/assets/images/logo/blue_96.png")

sha256sums=('0f21a66e2f3a0e265d28469b79a70984274bf4217727fae28650a6c1400c3e9f'
            'd5a7e0fed82f18ee51dac0258ba5070f145a18c4aa3235c0803afe1351043352'
            '81ea0848c8e3acaa6d1a45725494c3a9117517fda69dac3cda2e80a6e8af0e71')

package() {
    install -Dm755 "${srcdir}/elasticvue-${pkgver}" "${pkgdir}/usr/bin/elasticvue"
    install -Dm644 "${srcdir}/elasticvue.desktop" "${pkgdir}/usr/share/applications/elasticvue.desktop"
    install -Dm644 "${srcdir}/blue_96.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/elasticvue.png"
}
