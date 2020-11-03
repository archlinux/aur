# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.4.6
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
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('c0b40f06545612100be5804a9eed6e322f1b0cf7881e4860f87d838a191e327afe7b2578eed17b2e6f9278542ba4cc13ef499c3917a7d8379ae67302fb7fbe0c')

package() {
  cp -a usr $pkgdir/
}
