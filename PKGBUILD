# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.14.5'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.14.5/navidrome_0.14.5_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.14.5/navidrome_0.14.5_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.14.5/navidrome_0.14.5_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.14.5/navidrome_0.14.5_Linux_arm64.tar.gz')
md5sums_x86_64=('372f42c3656164bd1a5e91500b529397')
md5sums_armv6h=('3250f757862ffa892d71ac4108e33c14')
md5sums_armv7h=('53ce747fb83c5b119858ee0524770cd2')
md5sums_aarch64=('945720c13b111046a045a7938d4ebf15')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

