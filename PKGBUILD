# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.31.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.31.0/navidrome_0.31.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.31.0/navidrome_0.31.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.31.0/navidrome_0.31.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.31.0/navidrome_0.31.0_Linux_arm64.tar.gz')
md5sums_x86_64=('4b35dd5b10b2968d9ba83f41365a1baf')
md5sums_armv6h=('9a73490ee6a37b282617dcd45e9db8a6')
md5sums_armv7h=('15efffe1e7cccc94bd76323596bced83')
md5sums_aarch64=('c041086ac56457c29eef0bbed377f7e3')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

