# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# releases URL: https://github.com/AndydeCleyre/archbuilder_telegram-desktop-userfonts/releases

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.8.1  # match telegram-desktop-userfonts:pkgver
_pkgrel=3     # match telegram-desktop-userfonts:pkgrel
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
# depends match telegram-desktop-userfonts:depends
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm' 'webkit2gtk' 'pipewire' 'rnnoise')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")
# sha512sums match latest successful build at releases URL
sha512sums=('32b6750bb5d8bb9a04608b96c9c55437e8de2705a37b694e9d1a4873414aa6f876d78d43eb3bbc0bd1f47b80b4d3e3c5d15890868a4c9dfd52b50b1eaca1cc7f')

package() {
  cp -a usr $pkgdir/
}
