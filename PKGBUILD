# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.4.4
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/AndydeCleyre/archbuilder_telegram-desktop-userfonts/releases/download/${pkgver}/telegram-desktop-userfonts-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('a10e4a2dddb0800795e6ca95d0dd2351464a3124be091771cdfa9792713668b07e0c861842f469ad58157f9491e7a209ee85c262aab732822971160282f97c62')

package() {
  cp -a usr $pkgdir/
}
