# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.34.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.34.0/navidrome_0.34.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.34.0/navidrome_0.34.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.34.0/navidrome_0.34.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.34.0/navidrome_0.34.0_Linux_arm64.tar.gz')
md5sums_x86_64=('d4c7d7f0bb0bccd4b8857a6276e27472')
md5sums_armv6h=('5613ae6f3bda1690af63765df80867a6')
md5sums_armv7h=('3b08d2cc28ffb60d3b9a0b1e242b2c66')
md5sums_aarch64=('788429f37a720f2aad67eede4f359c0f')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

