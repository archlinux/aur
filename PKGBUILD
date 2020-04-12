# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.14.3'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.14.3/navidrome_0.14.3_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.14.3/navidrome_0.14.3_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.14.3/navidrome_0.14.3_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.14.3/navidrome_0.14.3_Linux_arm64.tar.gz')
md5sums_x86_64=('96378f47373abf478e5314718233b942')
md5sums_armv6h=('1e5e70d515aeec8010363150c7a9bd9c')
md5sums_armv7h=('c4c527c0e76a5dfd6eba4967699c6672')
md5sums_aarch64=('98df4bc229e904f061c32cf5a398b818')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

