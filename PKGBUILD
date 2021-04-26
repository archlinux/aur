# Maintainer: Sitansh Rajput <thelostpolaris [at] gmail [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.42.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_arm64.tar.gz')
md5sums_x86_64=('e0f4e08cf4a85d0a57c63b7b2869c99c')
md5sums_armv6h=('7ab3413a9ed2efc9337ff0f01159dbe7')
md5sums_armv7h=('2598a08f8605237fafa112783c227024')
md5sums_aarch64=('1c382ea25125c66a97034dee0e7afc8d')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

