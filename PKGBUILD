# Maintainer: Carsten König <carstenkoenig92@gmail.com>
pkgname=elasticvue-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="A free and open source gui for elasticsearch"
arch=('x86_64')
url="https://github.com/cars10/elasticvue"
license=('MIT')
provides=('elasticvue')
conflicts=('elasticvue')
options=('!debug' '!strip')

source=("elasticvue-${pkgver}::https://github.com/cars10/elasticvue/releases/download/v${pkgver}/elasticvue"
        "elasticvue.desktop"
        "blue_96.png::https://raw.githubusercontent.com/cars10/elasticvue/master/src/assets/images/logo/blue_96.png")

sha256sums=('794a22a2b18d3d55b394770497bc3ff790b1bfb81d2b5fa85038d4c837ab9313'
            'd5a7e0fed82f18ee51dac0258ba5070f145a18c4aa3235c0803afe1351043352'
            '81ea0848c8e3acaa6d1a45725494c3a9117517fda69dac3cda2e80a6e8af0e71')

package() {
    install -Dm755 "${srcdir}/elasticvue-${pkgver}" "${pkgdir}/usr/bin/elasticvue"
    install -Dm644 "${srcdir}/elasticvue.desktop" "${pkgdir}/usr/share/applications/elasticvue.desktop"
    install -Dm644 "${srcdir}/blue_96.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/elasticvue.png"
}
