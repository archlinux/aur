# Maintainer:  nozomi <gpxkhee9l@mozmail.com>

pkgname=fcitx5-qt-google-earth
pkgver=5.1.6
pkgrel=1
pkgdesc='Fcitx5 Qt5 Library for Google Earth Pro'
arch=('x86_64')
url='https://github.com/nozomi-yoshika/fcitx5-qt-builds'
license=('BSD')
depends=(
    'google-earth-pro'
    'fcitx5'
)
source=(
    'https://github.com/nozomi-yoshika/fcitx5-qt-builds/releases/download/v5.1.6/fcitx5-qt-builds-5.1.6.tar.gz'
)
sha256sums=('1b0b96c2d86e993035bbea36328d6d77c9e2e9831b1044b76cbd50c05b969d18')

_installdir='/opt/google/earth/pro/plugins/platforminputcontexts/'

package() {
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m755 earth/libfcitx5platforminputcontextplugin.so -t "${pkgdir}/${_installdir}"
}

