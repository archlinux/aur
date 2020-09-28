# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.34.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.34.1/navidrome_0.34.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.34.1/navidrome_0.34.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.34.1/navidrome_0.34.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.34.1/navidrome_0.34.1_Linux_arm64.tar.gz')
md5sums_x86_64=('34fc72b7186be6b6207d814cf0d7acd6')
md5sums_armv6h=('4099306b610d9e3d4912ad165af78892')
md5sums_armv7h=('1de2f18ce364cb786314f35698c4ab46')
md5sums_aarch64=('81ff14f10af1a20ee5d974911b7a17ef')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

