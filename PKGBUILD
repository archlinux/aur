# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=kwin-scripts-mudeer
_name=Mudeer
pkgver=5.1
pkgrel=1
pkgdesc="Screen Splitting Shortcuts ideal for Ultrawide and Super-Ultrawide Monitors"
arch=('any')
url="https://github.com/darkstego/Mudeer"
license=('MIT')
depends=('plasma-workspace')
source=("${_name}-${pkgver}.tar.gz::https://github.com/darkstego/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3b6a7919791c0958d7459575e15d7f7663169cd66c98dcfee1bbe20835f051df8f4e66bd84e241d60468c676a90ed6843f1577e6a790eaf78c2db5a3827a5aba')

package() {
    cd ${_name}-${pkgver}
    mkdir -p "${pkgdir}/usr/share/kwin/scripts/mudeer"
    cp -r package/* "${pkgdir}/usr/share/kwin/scripts/mudeer/"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
