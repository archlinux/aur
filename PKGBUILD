# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.35.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.35.1/navidrome_0.35.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.35.1/navidrome_0.35.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.35.1/navidrome_0.35.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.35.1/navidrome_0.35.1_Linux_arm64.tar.gz')
md5sums_x86_64=('b46c53bb2515e324d02b805525897c54')
md5sums_armv6h=('911a3068769225dafc66ed5309cb4ae8')
md5sums_armv7h=('1a566c0c26f9141ad24d0c00cc07ed30')
md5sums_aarch64=('6ecdbd5ed0ea273c8f0b9aed428ff35f')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

