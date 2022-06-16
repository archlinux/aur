# Maintainer: lightning1141 <lightning1141@gmail.com>

pkgname=umeet
# the versin is from deb package
pkgver=5.5.105.0315
pkgrel=0
pkgdesc="Umeet - https://www.umeet.com.cn/"
arch=("x86_64")
url="https://www.umeet.com.cn/"
license=('custom')
depends=()

source=("${pkgname}_${pkgver}_amd64.deb::https://didivc.systeccloud.com/client/latest/${pkgname}_amd64.deb")

sha256sums=('6195ffe2bf7c182c59e1a95b3f9d7bb1242dc25c3a8ad02c4b7d5d79ad0a84ee')

package() {
    tar xf data.tar.xz -C ${pkgdir}/
}
