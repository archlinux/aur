# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.8.0
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=(
    'gconf'
    'libnotify'
    'libappindicator-gtk2'
    'libappindicator-gtk3'
    'libxtst'
    'nss'
    'libxss'
)
source=(
    'https://resource.u-tools.cn/version/utools_'${pkgver}'-beta_amd64.deb'
)
md5sums=(
    '496298315327cdc694e0885b77465319'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
