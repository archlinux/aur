# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.32.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.32.0/navidrome_0.32.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.32.0/navidrome_0.32.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.32.0/navidrome_0.32.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.32.0/navidrome_0.32.0_Linux_arm64.tar.gz')
md5sums_x86_64=('b4b34179600ad9700913a8ab3062b545')
md5sums_armv6h=('ea3f0d702f28bd2370abd35c2485aae5')
md5sums_armv7h=('5f37aae5cb034cd4d5863a1125bfc6ac')
md5sums_aarch64=('cadc3faeae26335c9412c004653bb715')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

