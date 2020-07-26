# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.27.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.27.0/navidrome_0.27.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.27.0/navidrome_0.27.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.27.0/navidrome_0.27.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.27.0/navidrome_0.27.0_Linux_arm64.tar.gz')
md5sums_x86_64=('098c84d026fd83350d8a44c2b67e3b90')
md5sums_armv6h=('5b2b2aad3eb4df18abd8c46e5c81e81f')
md5sums_armv7h=('5c95539b8ee9d0d641aa657a8a985e29')
md5sums_aarch64=('e850c7e618da1286b1708cc5e21a38dd')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

