# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.25.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.25.0/navidrome_0.25.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.25.0/navidrome_0.25.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.25.0/navidrome_0.25.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.25.0/navidrome_0.25.0_Linux_arm64.tar.gz')
md5sums_x86_64=('1a292b58bbffb8a8089fbf9199da142d')
md5sums_armv6h=('bab4cdc0e2e50703b165f13301697e80')
md5sums_armv7h=('5213ad0b3d9adbcb370de6c329263f3d')
md5sums_aarch64=('f28f54532df23c49d88c6789f4876bee')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

