# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.7.1
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
    '3a939a2e8e06c04c885f948c717d8432'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
