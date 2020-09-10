# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.33.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.33.0/navidrome_0.33.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.33.0/navidrome_0.33.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.33.0/navidrome_0.33.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.33.0/navidrome_0.33.0_Linux_arm64.tar.gz')
md5sums_x86_64=('f1fd050efc88abdbd705f48223c55541')
md5sums_armv6h=('36c777d1c5010578685d4ccebbd260f1')
md5sums_armv7h=('01bd026013ca0f31aacc4ccfcbcba556')
md5sums_aarch64=('3c1336020c9cefef498f5cf912010115')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

