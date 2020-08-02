# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.28.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.28.0/navidrome_0.28.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.28.0/navidrome_0.28.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.28.0/navidrome_0.28.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.28.0/navidrome_0.28.0_Linux_arm64.tar.gz')
md5sums_x86_64=('b1e804fd446e38723fe5d0162c0c22b8')
md5sums_armv6h=('92af72ce84dc255726819fdb7527c43e')
md5sums_armv7h=('29e61c94ca3a22b89891e2d8700241be')
md5sums_aarch64=('cebe07a8daef20fb39961ab76b0ce86c')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

