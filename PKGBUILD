# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.40.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.40.0/navidrome_0.40.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.40.0/navidrome_0.40.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.40.0/navidrome_0.40.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.40.0/navidrome_0.40.0_Linux_arm64.tar.gz')
md5sums_x86_64=('22a3d5a1a03cbabbfb3838e5cc4fa397')
md5sums_armv6h=('98b69432481963743fe5b42a9003a7be')
md5sums_armv7h=('8d494941c04fa85fd056be37e63727e8')
md5sums_aarch64=('ab162cf38118274b8e1a5628959d4abf')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

