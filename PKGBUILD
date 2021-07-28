# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e801-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck801-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3773407599358185472'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e801-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594863442329/SmartL_E801-v1.6.zip"
        "csky-cpu-ck801-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594863476205/SmartL_CK801-v1.6.zip"
        )

sha256sums=('5d8b63d41d48f949cd562a98745680f509fc953d20641bad89a20cf12da175d9'
            'bfa518d2fb316e90a504ec4d2d149b365af92559115f7efdef3748d375e9642e')

noextract=(csky-cpu-e801-csi-rtos-sdk-${pkgver}.zip csky-cpu-ck801-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e801-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E801 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-ck801-csi-rtos-sdk() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="C-Sky CPU CK801 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
