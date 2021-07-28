# Maintainer: taotieren <admin@taotieren.com>

pkgname=csi-dsp-lib
_pkgname=${pkgname%-lib}
pkgver=3.13
pkgrel=1
epoch=
pkgdesc="C-Sky DSP library supports C860v/CK803ef/CK804e/CK804ef/CK805/CK805e/CK805ef/CK860fv/E804d/E804d/E804df/I805."
arch=('any')
url="https://occ.t-head.cn/community/download?id=3854657524808884224"
license=('Apache')
groups=()
depends=('bash')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1607416549470/${_pkgname}-v${pkgver}.tar.gz")
noextract=()
sha256sums=('f5ff1305814fc62ca1778f98a6a3fed625f5d9a3237805463d2b7b1106c22498')
#validpgpkeys=()


package() {
    install -dm0755 "${pkgdir}/opt/t-head/${_pkgname}"
    cp -r "${srcdir}/install/." "${pkgdir}/opt/t-head/${_pkgname}"
}
