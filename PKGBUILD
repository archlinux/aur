# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# releases URL: https://github.com/AndydeCleyre/archbuilder_telegram-desktop-userfonts/releases

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.8.2  # match telegram-desktop-userfonts:pkgver
_pkgrel=1     # match telegram-desktop-userfonts:pkgrel
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
# depends match telegram-desktop-userfonts:depends
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm'
         'webkit2gtk' 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' )
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")
# sha512sums match latest successful build at releases URL
sha512sums=('d5858ff5b4e604b4c97805a92a8382c82f35be4d9583b8db63cb3523bf051ff54fc1da9aa9cf754a831f16a38231f126a4651f5c3d9da090730a076af3f39d08')

package() {
  cp -a usr $pkgdir/
}
