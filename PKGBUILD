# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.5
pkgrel=1
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('mit')
depends=('qt5-base')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('f20952c459a48776b29b13c19211e56bda0770135ff1bcc471f54f1d7f91f9e9')

package() {
  ./build.sh

  mkdir -p "$pkgdir/usr/bin/"
  install -D build/dist/FFaudioConverter "$pkgdir/usr/bin/ffaudioconverter"
}
