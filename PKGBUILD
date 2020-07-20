# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.26.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.26.0/navidrome_0.26.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.26.0/navidrome_0.26.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.26.0/navidrome_0.26.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.26.0/navidrome_0.26.0_Linux_arm64.tar.gz')
md5sums_x86_64=('0939a55a1742b504f572be735866ee89')
md5sums_armv6h=('03735f43557002a883c0a2364f19e5aa')
md5sums_armv7h=('f94a43a02397e136949a871f11de16ae')
md5sums_aarch64=('72f3d813dcc90a8671137fedc33ca9de')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

