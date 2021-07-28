# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e802-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck802-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=580568627539443712'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-ck802-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577156180657/SmartL_CK802-v1.6.zip"
        )

sha256sums=('36f16c562eb9da4b552c5ad1b5207b26ebaa68ad8417c57af0b1599a73f1eb39')

noextract=(csky-cpu-ck802-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e802-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E802 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-ck802-csi-rtos-sdk)
}

package_csky-cpu-ck802-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK802 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
