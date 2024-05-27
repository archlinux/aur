# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=kwin-scripts-mudeer
_name=Mudeer
pkgver=5.0
pkgrel=1
pkgdesc="Screen Splitting Shortcuts ideal for Ultrawide and Super-Ultrawide Monitors"
arch=('any')
url="https://github.com/darkstego/Mudeer"
license=('MIT')
depends=('plasma-workspace')
source=("${_name}-${pkgver}.tar.gz::https://github.com/darkstego/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ae4e2b0a74fdd25a53fe6920c0caedd0b1aad69ee83d799d6a0ec850447fe44244e71b8f12f0f8814a6e1e12630498cb99f8f0c63ea61188d2d866355a3fd5e3')

package() {
    cd ${_name}-${pkgver}
    mkdir -p "${pkgdir}/usr/share/kwin/scripts/mudeer"
    cp -r package/* "${pkgdir}/usr/share/kwin/scripts/mudeer/"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
