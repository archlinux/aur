# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360cloud
pkgver=1.0.0.1010
pkgrel=1
pkgdesc="360 Cloud Drive"
arch=('x86_64')
url="https://yunpan.360.cn/"
license=('custom')
source=(
    'https://github.com/redchenjs/aur-packages/raw/master/360cloud/360cloud-1.0.0.1010-deepin-x86_64.deb'
)
md5sums=(
    '4579d52385113744079277eb82035631'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/

    rm "${pkgdir}"/opt/360cloud/*.so*
}
