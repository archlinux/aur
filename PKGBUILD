# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.41.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.41.1/navidrome_0.41.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.41.1/navidrome_0.41.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.41.1/navidrome_0.41.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.41.1/navidrome_0.41.1_Linux_arm64.tar.gz')
md5sums_x86_64=('850fc5b78bea1bde6b6cd2ee87c21c28')
md5sums_armv6h=('bb7747bb5249fc1314ec99d348c120b9')
md5sums_armv7h=('ac31b486b8dc9d585844200d6322c77c')
md5sums_aarch64=('3e27ddd089e3bdd2dabd4e242cb544dc')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

