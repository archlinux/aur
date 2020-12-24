# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.5.1
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha512sums=('152c9da76584bd6beba56c48fdd80299198933adc6a0dffb2099b9adcfb3febc2c23557e0facb029dfb341c187155fc8eb4556fb35193da99ad92afaefe23ab0')

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
