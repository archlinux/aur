# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e907-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-e907p-csi-rtos-sdk csky-cpu-e907f-csi-rtos-sdk csky-cpu-e907fd-csi-rtos-sdk csky-cpu-e907fp-csi-rtos-sdk csky-cpu-e907fdp-csi-rtos-sdk)
pkgver=1.7.8
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3916180248689188864'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e907-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263526342/SmartL_E907-R1S2-V1.7.8.zip"
        "csky-cpu-e907p-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263551834/SmartL_E907P-R1S2-V1.7.8.zip"
        "csky-cpu-e907f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263595111/SmartL_E907F-R1S2-V1.7.8.zip"
        "csky-cpu-e907fd-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263693992/SmartL_E907FD-R1S2-V1.7.8.zip"
        "csky-cpu-e907fp-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263620843/SmartL_E907FP-R1S2-V1.7.8.zip"
        "csky-cpu-e907fdp-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1627263715697/SmartL_E907FDP-R1S2-V1.7.8.zip"
        )

sha256sums=('ad769309ed2a79d0e57f6117bfbfb14419cea40de28ec048220782a8ea2008d1'
            'c78fb813972b02e5d8b1506b0f0b717be85dd25c522aabf0c0aabc49a38fed4a'
            'e9692e4499ce5d192e66169aab95d6d75b1a8b2ed4553edb1155a3bd82e261ef'
            '51ef66a04ea992d0fc3b615010efe0ede35d6b777955e83fe493daa70b454a15'
            '3659fad740f81b2746ffbd4ed9f74beb1302c901b71b2a0c27a98a0aaf40b725'
            'd7cb033b5fdb8045cb0a6a446621b79170314ca91f7bc0a7c0c64a398cdbb2e9')

noextract=(csky-cpu-e907-csi-rtos-sdk-${pkgver}.zip csky-cpu-e907p-csi-rtos-sdk-${pkgver}.zip csky-cpu-e907f-csi-rtos-sdk-${pkgver}.zip csky-cpu-e907fd-csi-rtos-sdk-${pkgver}.zip csky-cpu-e907fp-csi-rtos-sdk-${pkgver}.zip csky-cpu-e907fdp-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e907-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e907p-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907P CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e907f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}


package_csky-cpu-e907fd-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907FD CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e907fp-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907FP CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-e907fdp-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E907FDP CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
