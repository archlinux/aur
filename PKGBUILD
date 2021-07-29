# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-s802-guide
pkgname=($pkgbase)
pkgver=0.0.01
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581552337944838144'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "S802集成手册-v1.3.5.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/upload-file/resource/420262990181302272/1566875260011/S802%E9%9B%86%E6%88%90%E6%89%8B%E5%86%8C.pdf"
        "S802用户手册-v1.2.15.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/upload-file/resource/420262990181302272/1566875243407/S802%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf"
        )

sha256sums=('39030da9ad3339f1f447e8488bfd550915e490ccda44e5c98a392b32648df73b'
            '70048aa2c860a5f1bd044c861563e7e146528c8e54cb3ee250f3c98ef27e5f06')

noextract=()

package_csky-cpu-s802-guide() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="C-Sky CPU S802 guide"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

# vim: ts=4 sw=4 et
