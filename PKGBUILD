# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-c807-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck807f-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581552316738437120'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-ck807f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594819201014/SmartH_CK807F-v1.6.zip"
        )

sha256sums=('3b0cb94006334fbd37174ad9421542fc23368538adf7741c1f02bf9e2f090697')

noextract=(csky-cpu-ck807f-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-c807-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU C807 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-ck807f-csi-rtos-sdk)
}

package_csky-cpu-ck807f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK807F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
