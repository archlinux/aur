# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.37.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.37.0/navidrome_0.37.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.37.0/navidrome_0.37.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.37.0/navidrome_0.37.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.37.0/navidrome_0.37.0_Linux_arm64.tar.gz')
md5sums_x86_64=('947a80b633584b12da6bde86b6867b84')
md5sums_armv6h=('c4d20adb349728a0951dfe96cb584f06')
md5sums_armv7h=('a2ddbbbb70a440c0a3d1995ce9a09f48')
md5sums_aarch64=('eb33bde3bbf3f13eb134a7892cc1e225')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

