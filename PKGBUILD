# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
_pkgname=icalingua
pkgver=2.9.2
pkgrel=1
epoch=
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=('AGPL3')
replaces=(electron-qq icalingua-plus-plus icalingua++)
depends=(electron17 ffmpeg libappindicator-gtk3)
optdepends=(hicolor-icon-theme mongodb-bin redis)
options=()
provides=(icalingua)
conflicts=(icalingua++ icalingua++-appimage)
install=
source=("${_pkgname}-${pkgver}.pkg.tar.zst::https://github.com/Icalingua-plus-plus/Icalingua-plus-plus/releases/download/v2.9.2/icalingua++-2.9.2-2-x86_64.pkg.tar.zst")
sha256sums=('782ff4178404af96f9b18b7b9238dfb5c0dbfb73aadcca1ff6a11d2006e69da6')
package() {
    cp -ra "${srcdir}/usr" "${pkgdir}"
}