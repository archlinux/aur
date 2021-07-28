# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e804-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-e804e-csi-rtos-sdk csky-cpu-e804ef-csi-rtos-sdk csky-cpu-e804d-csi-rtos-sdk csky-cpu-e804df-csi-rtos-sdk csky-cpu-e804f-csi-rtos-sdk)
pkgver=1.6.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581563230996922368'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e804e-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263323081/SmartL_E804D-v1.6.6.zip"
        "csky-cpu-e804ef-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1584583377902/SmartL_CK804EF-v1.6.zip"
        "csky-cpu-e804d-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263323081/SmartL_E804D-v1.6.6.zip"
        "csky-cpu-e804df-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577154498383/SmartL_E804DF-v1.6.zip"
        "csky-cpu-e804f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263354999/SmartL_E804F-v1.6.6.zip"
        )

sha256sums=('6ac6852d7c1daa8f6bcd43f81d682d4e80909923ae1ade0eafa04661d7228624'
            'da2e70dd1fcfb1c33cdc05839273cff8dade2e91bb6babc310baf307c5df9c78'
            '6ac6852d7c1daa8f6bcd43f81d682d4e80909923ae1ade0eafa04661d7228624'
            'c217b11ab7de36159578e9bc3c4279bfa036f18169fd48272192d45fa2b3aa0e'
            'acc2df28a00fb55f1ff894c92b87cc4e8ae86e6cf2071d7a577b79644050ccc4')

noextract=(csky-cpu-e804e-csi-rtos-sdk-${pkgver}.zip csky-cpu-e804ef-csi-rtos-sdk-${pkgver}.zip csky-cpu-e804d-csi-rtos-sdk-${pkgver}.zip csky-cpu-e804df-csi-rtos-sdk-${pkgver}.zip csky-cpu-e804f-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e804-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-e804e-csi-rtos-sdk csky-cpu-e804ef-csi-rtos-sdk csky-cpu-e804d-csi-rtos-sdk csky-cpu-e804df-csi-rtos-sdk csky-cpu-e804f-csi-rtos-sdk)
}

package_csky-cpu-e804e-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804E CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e804ef-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804EF CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e804d-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804D CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e804df-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804DF CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e804f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E804F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
