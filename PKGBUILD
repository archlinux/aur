# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-c810-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck810f-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581565156799021056'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-ck810f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1584672471641/SmartH_CK810F-v1.6.zip"
        )

sha256sums=('9d246039aec2e513cef3aa6e42ed7cda95e43367150c48ce754c8d6ec956ab4b')

noextract=(csky-cpu-ck810f-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-c810-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU C810 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-ck810f-csi-rtos-sdk)
}

package_csky-cpu-ck810f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK810F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
