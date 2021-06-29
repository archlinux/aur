# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# releases URL: https://github.com/AndydeCleyre/archbuilder_telegram-desktop-userfonts/releases

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.8.3  # match telegram-desktop-userfonts:pkgver
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
sha512sums=('31a4ea61cd5c31c0315d26716b96d06e4c3a4158e47e02de0b26ada6628bdedff41cf2285046d37769734df142f2ded9ab87a876f8522204a85380f353e42460')

package() {
  cp -a usr $pkgdir/
}
