# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.4.7
pkgrel=3
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('a896c8440730633d80ee3a82b448265cfc784270fce7ce06f2e8c247c979b80c8cbf1fe440fb15beef87240f12adb3c055173d76d4be2e8498e079f194ff9de8')

package() {
  cp -a usr $pkgdir/
}
