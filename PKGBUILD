# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.26.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.26.1/navidrome_0.26.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.26.1/navidrome_0.26.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.26.1/navidrome_0.26.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.26.1/navidrome_0.26.1_Linux_arm64.tar.gz')
md5sums_x86_64=('6d5f226e978ac427297b81d470491bf7')
md5sums_armv6h=('c32edd0b54d1abf78a87eb178f0fe241')
md5sums_armv7h=('578937624992cb362dfdf409a3ea65bc')
md5sums_aarch64=('9017061f14318b6d90de356a8e4c71a6')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

