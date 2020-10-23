# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.36.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.36.1/navidrome_0.36.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.36.1/navidrome_0.36.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.36.1/navidrome_0.36.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.36.1/navidrome_0.36.1_Linux_arm64.tar.gz')
md5sums_x86_64=('9a270649e334a1238cf2d0a1696b36e6')
md5sums_armv6h=('6c5993859dbc6133e0bd1773a62a77b9')
md5sums_armv7h=('bd7d304e6e1f2076c210532f2ddef6ba')
md5sums_aarch64=('6bcde0f3e2f38ea6a36fec79dea3b9c2')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

