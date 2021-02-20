# Maintainer: desbma
pkgname=python-onvif-zeep
pkgver=0.2.12
pkgrel=1
pkgdesc='ONVIF Client Implementation in Python '
arch=('any')
url="https://github.com/FalkTannhaeuser/${pkgname}"
license=('MIT')
depends=('python'
         'python-setuptools'
         'python-zeep')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FalkTannhaeuser/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('148eb31b03aa980b3b026c1a0127d1263aabeadca85444c70d9df4874415ec4cb5f0449fa1232c40bced92733116d43bbaeef58ea1689080d9dae04ce99ac31c')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
