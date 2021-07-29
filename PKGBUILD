# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-c906-csi-rtos-sdk
pkgname=($pkgbase)
pkgver=1.7.3
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3803060952769826816'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-c906-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/null/1609222581128/smarth-C906-RV64-1.7.3.zip"
        )

sha256sums=('73a94152e35233592f5692ed553599b9cb1b74eceabd6d8dd0499959ba00f909')

noextract=(csky-cpu-c906-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-c906-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU C906 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
