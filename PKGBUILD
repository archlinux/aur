# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.3
pkgrel=2
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('mit')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bleuzen/FFaudioConverter/archive/v$pkgver.tar.gz")
sha256sums=('db7de55dc30c563b12c2aef861c2192090c96a17a16bdb8b59a1497109eb9c13')

package() {
  cd FFaudioConverter-$pkgver
  ./build.sh

  mkdir -p "$pkgdir/usr/bin/"
  install -D build/dist/FFaudioConverter "$pkgdir/usr/bin/ffaudioconverter"
}
