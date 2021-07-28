# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e906-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-e906p-csi-rtos-sdk csky-cpu-e906f-csi-rtos-sdk csky-cpu-e906fd-csi-rtos-sdk csky-cpu-e906fdp-csi-rtos-sdk)
pkgver=1.7.8
pkgrel=2
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3902100504121253888'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e906-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263860676/SmartL_E906-R2S2-V1.7.8.zip"
        "csky-cpu-e906p-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263892084/SmartL_E906P-R2S2-V1.7.8.zip"
        "csky-cpu-e906f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263939283/SmartL_E906F-R2S2-V1.7.8.zip"
        "csky-cpu-e906fd-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627264071532/SmartL_E906FD-R2S2-V1.7.8.zip"
        "csky-cpu-e906fdp-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627264041381/SmartL_E906FDP-R2S2-V1.7.8.zip"
        )

sha256sums=('4331b5fa374d05459e3bc9d918020f89dd52364e3aff35dfd42eeb8a00b0f23d'
            'd76b454f40fc00b2b7b00e7198ee856b281b01abce4ed51007f8085c89e25d5f'
            '31e13dc6257330f07b9a0556d225266a8cf330830be1c34c6d2f1e031b7c697b'
            '0015087144ec5be67b249891c8d97197fe9ada3e0fdf4b1a968ca08bcb833dec'
            '3659fad740f81b2746ffbd4ed9f74beb1302c901b71b2a0c27a98a0aaf40b725'
            'e4fd04933794cd691e8c4101e5963ea4c9f451068f41179550e97b3e2e2dac2e')

noextract=(csky-cpu-e906-csi-rtos-sdk-${pkgver}.zip csky-cpu-e906p-csi-rtos-sdk-${pkgver}.zip csky-cpu-e906f-csi-rtos-sdk-${pkgver}.zip csky-cpu-e906fd-csi-rtos-sdk-${pkgver}.zip csky-cpu-e906fdp-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e906-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E906 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e906p-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E906P CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e906f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E906F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}


package_csky-cpu-e906fd-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E906FD CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e906fdp-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E906FDP CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
