# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.5.8
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha512sums=('fa210c8a9a07ca274f4f42d1591451e1d55cac6d22eed8dc4f143022b80dfd16ce5f840ac0fab23fd2b5df6a50da293d1dbf75d323c30dd384f46e5926e0a03f')

package() {
  cp -a usr $pkgdir/
}

# Maintenance Checklist:
# - match latest successful build:
#   - pkgver
#   - pkgrel
#   - sha512sums
# - match AUR package telegram-desktop-userfonts:
#   - pkgver
#   - pkgrel
#   - depends
# - makepkg --printsrcinfo >.SRCINFO
