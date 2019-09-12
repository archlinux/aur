# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360cloud
pkgver=1.0.0.1010
pkgrel=2
pkgdesc="360 Cloud Drive"
arch=('x86_64')
url="https://yunpan.360.cn/"
license=('custom')
source=(
    'http://down.360safe.com/360eyun/360cloud-'${pkgver}'-deepin-x86_64.deb'
)
md5sums=(
    '672fc0c365a2375a1567e821b560677a'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
