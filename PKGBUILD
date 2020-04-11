# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.14.2'
pkgrel=2
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.14.2/navidrome_0.14.2_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.14.2/navidrome_0.14.2_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.14.2/navidrome_0.14.2_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.14.2/navidrome_0.14.2_Linux_arm64.tar.gz')
md5sums_x86_64=('dab17486189d6f48c81dfd20e500d77b')
md5sums_armv6h=('496cbc6b8309534adb80c97d1b8e8d7c')
md5sums_armv7h=('08a34284100dad7b2ca1a12692f8bfa7')
md5sums_aarch64=('e38ae9c7cd9149473a3b4eaaa3e4165a')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

