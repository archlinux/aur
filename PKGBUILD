# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.3
pkgrel=1
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/Blizcord/"
license=('mit')
depends=('qt5-base')
source=("ffaudioconverter::https://github.com/Bleuzen/FFaudioConverter/releases/download/v${pkgver}/FFaudioConverter")
sha256sums=('c93793f896cfdf39d72760d70915e02b4c3e03ba323ed0956eb70bf01ee72d8f')

package() {
  mkdir -p "$pkgdir"/usr/bin/

  install -D ffaudioconverter "$pkgdir"/usr/bin/
}
