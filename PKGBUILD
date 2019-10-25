# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.8.3
pkgrel=2
pkgdesc='uTools Utilities'
arch=('x86_64')
url='https://u.tools/'
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
    'https://resource.u-tools.cn/currentversion/utools_'${pkgver}'-beta_amd64.deb'
)
md5sums=(
    'e9f502cf06eda0804c5741a613c3aed7'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/uTools/utools ${pkgdir}/usr/bin/utools
}
