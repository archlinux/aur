# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wolai-bin
_pkgname=wolai
pkgver=1.2.6
pkgrel=3
pkgdesc="wolai"
arch=("x86_64")
url="https://www.wolai.com/"
license=('unknown')
depends=()
provides=()
options=(!strip)
source=("${_pkgname}-${pkgver}.deb::https://cdn.wostatic.cn/dist/installers/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('9b5840ddaef1acad3e2aed8ec3bdf5dee39eed413f0b20baf769d84d68af7da3')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}