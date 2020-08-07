# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.29.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.29.0/navidrome_0.29.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.29.0/navidrome_0.29.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.29.0/navidrome_0.29.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.29.0/navidrome_0.29.0_Linux_arm64.tar.gz')
md5sums_x86_64=('9d90352d8c79696f790be30a1c6b7abe')
md5sums_armv6h=('521b243184cc02b2d674198b36964c0a')
md5sums_armv7h=('4c325e33985afaef22f4c545b57925c3')
md5sums_aarch64=('047605ad1ed5925de8cf12e768ae4bfd')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

