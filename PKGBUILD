# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.4
pkgrel=1
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('mit')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bleuzen/FFaudioConverter/archive/v$pkgver.tar.gz")
sha256sums=('7d145d49919dca20717270325da2298a82cf29fd2eceb4feb25994cdbd9a894e')

package() {
  cd FFaudioConverter-$pkgver
  ./build.sh

  mkdir -p "$pkgdir/usr/bin/"
  install -D build/dist/FFaudioConverter "$pkgdir/usr/bin/ffaudioconverter"
}
