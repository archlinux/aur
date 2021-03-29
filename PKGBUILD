# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.7.1
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha512sums=('7a88e1da52968fbd3f32809deafe5fe7cc7df2cbdf244b6f8b199b16ca2677d96b762daa4b8d71cbc68f8df9eedd19315b9aebd645fd8a08a2c54ac05a115e79')

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
