# Maintainer: Leihu Xi<leihuxi@gmail.com>

pkgname=miliao
pkgver=4.0.32
pkgrel=1
pkgdesc="MiLiao Messenger"
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
    'ec0c31da5f3fca66eef23c2030e2d44a'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
