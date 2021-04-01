# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.41.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.41.0/navidrome_0.41.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.41.0/navidrome_0.41.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.41.0/navidrome_0.41.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.41.0/navidrome_0.41.0_Linux_arm64.tar.gz')
md5sums_x86_64=('a8bffaed76f759fe4162f0166aec99bb')
md5sums_armv6h=('571b924da96806e72210ebb9f12816b8')
md5sums_armv7h=('276c51a6b7463aed077218d08765e932')
md5sums_aarch64=('7610d3c90f4543866f30c3521066408a')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

