# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.6.1
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
sha512sums=('14fb1fec85e4f4110e3e4504ef89abebf9c4eb1b0204ef8d75d88d060808a4fe78ea42a9a5a2a1a6079d631f31f2432bc2e1202654edfcf9d710f8aec32e3bb0')

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
