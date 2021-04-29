# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.7.4
_pkgrel=1
pkgrel=2
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm' 'webkit2gtk')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")
sha512sums=('c8dd43ee3c46f689167dade7bae5958aa21fe785574eddc4d63a70180a789ffe38cd17387f205b518022d033f9e9aa2b1489b0496fb6adf33e996a7cce03fd5a')

package() {
  cp -a usr $pkgdir/
}

# Maintenance Checklist:
# - match AUR package telegram-desktop-userfonts:
#   - pkgver
#   - pkgrel (_pkgrel here)
#   - depends
# - match latest successful build:
#   - pkgrel
#   - sha512sums
# - makepkg --printsrcinfo >.SRCINFO
