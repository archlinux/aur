# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-yuanmo
pkgver=0.72
pkgdesc="来自荆南字坊的荆南缘默体"
pkgrel=1
arch=(any)
url='https://github.com/maoken-fonts/KNYuanmo'
license=(OFL1.1)
depends=()
makedepends=()
source=("knyuanmo-regular.ttf::${url}/raw/main/fonts/TTF/KNYuanmo-Regular.ttf")
sha256sums=('42b3d600be957985206f0804fcbaceca8e83b18e6b7bfe8341b5ffa7eb4d40d9')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    cp "${srcdir}/knyuanmo-regular.ttf" "${pkgdir}/usr/share/fonts/TTF"
}
