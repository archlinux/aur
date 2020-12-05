# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.39.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.39.0/navidrome_0.39.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.39.0/navidrome_0.39.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.39.0/navidrome_0.39.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.39.0/navidrome_0.39.0_Linux_arm64.tar.gz')
md5sums_x86_64=('8d2d855ae3ab5ff86f634e37749646d0')
md5sums_armv6h=('0a9b1a33a7ef4cdd6aa13c668b1f8845')
md5sums_armv7h=('d5519bef18e1f0476e1b10b124b496d2')
md5sums_aarch64=('fe6cc227adb43e05a8d4d9da704d8a75')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

