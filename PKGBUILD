# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.57
pkgrel=1
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com/"
license=('custom')
depends=(
    'gconf'
    'libnotify'
    'libappindicator-gtk2'
    'libappindicator-gtk3'
    'libxtst'
    'nss'
    'libxss'
    'xorg-xrandr'
)
source=(
    'https://s1.zb.mi.com/miliao/apk/miliao/7.4/MiTalk_'${pkgver}'.deb'
)
md5sums=(
    '3c0513a0ecd7129bd611e3f24e73524a'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
