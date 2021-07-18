# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin
pkgver=2.8.11  # match telegram-desktop-userfonts:pkgver
_pkgrel=1      # match telegram-desktop-userfonts:pkgrel
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
         'webkit2gtk' 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc')
source=("https://github.com/AndydeCleyre/archbuilder_${_pkgname}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")
# sha512sums match latest successful build at releases URL
sha512sums=('14f20c3f5fda5316e2b3bb3809227aba816822536c69609f4e4821a326d03fac1aa96642d3e696ec13909377d580e98791a6f25a950a03471be0755f40975082')

package() {
  cp -a usr $pkgdir/
}
