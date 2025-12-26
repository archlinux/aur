# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: Kevin_Liu <we123445@outlook.com>
# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=vofa+
_pkgname=vofaplus
pkgver=1.4.5
pkgrel=1
pkgdesc="A high degree of freedom embedded debugging tool with plugins support."
arch=('x86_64')
url="https://www.vofa.plus/"
license=('custom')
provides=("${_pkgname}")
options=('!strip')
#source=("${pkgname}-${pkgver}.pkg.tar.zst::https://je00.github.io/downloads/${pkgname}-${pkgver}-1-${CARCH}.pkg.tar.zst")
source=("${pkgname}-${pkgver}.pkg.tar.gz::https://gitee.com/gutega/Vodka/releases/download/1.4/vofaplus-${pkgver}-${pkgrel}-x86_64.tar.gz")
sha256sums=('7044d3436b137efa0eb9f90e72aad77988daa278c2a35551d149bb260cd6cb71')

package() {
  cp -aR ${srcdir}/${pkgname}-${pkgver}/opt ${pkgdir}
  cp -aR ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}
}
# vim: set sw=2 ts=2 et:
