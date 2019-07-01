# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.7.0_beta
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
    'https://resource.u-tools.cn/version/utools_0.7.0-beta_amd64.deb'
)
md5sums=(
    '64a639421f36849a549f0b290a8c81f8'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
