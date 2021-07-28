# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e902-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-e902m-csi-rtos-sdk)
pkgver=1.7.3
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3916180248689188864'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e902-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1617782454340/SmartL_E902_RV32EC-R2S0P0-V1.7.3.zip"
        "csky-cpu-e902m-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1617782485250/SmartL_E902M_RV32EMC-R2S0P0-V1.7.3.zip"
        )

sha256sums=('2338700dd1f430444584fd6b2f4c01569712a18081d98fff811c57f880cb2f67'
            'c8503fcae29c3c6f6c968b3a08f208acf58ae9770248188885a525810c9347c5')

noextract=(csky-cpu-e902-csi-rtos-sdk-${pkgver}.zip csky-cpu-e902m-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e902-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E902 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e902m-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E902M CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
