# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.24.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.24.0/navidrome_0.24.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.24.0/navidrome_0.24.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.24.0/navidrome_0.24.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.24.0/navidrome_0.24.0_Linux_arm64.tar.gz')
md5sums_x86_64=('5c3cb58cb2d181042987a20c207dee08')
md5sums_armv6h=('6a130e171da3014f56e12290c19ea20f')
md5sums_armv7h=('be17f946026346e2a441361ce4836904')
md5sums_aarch64=('4afdbedcfd9e0d6c086c03bcaed8fd1e')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

