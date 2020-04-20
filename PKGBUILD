# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.15.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.15.0/navidrome_0.15.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.15.0/navidrome_0.15.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.15.0/navidrome_0.15.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.15.0/navidrome_0.15.0_Linux_arm64.tar.gz')
md5sums_x86_64=('dfae861073d265852325aaa06394fae1')
md5sums_armv6h=('1c96e6d3b35dfacf5f1af6352f25374b')
md5sums_armv7h=('d73863bfa6bcec739a35da1793fdff80')
md5sums_aarch64=('f87f762307168343276e4ae43793cb68')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

