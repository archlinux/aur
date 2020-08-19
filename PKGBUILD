# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.30.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.30.1/navidrome_0.30.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.30.1/navidrome_0.30.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.30.1/navidrome_0.30.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.30.1/navidrome_0.30.1_Linux_arm64.tar.gz')
md5sums_x86_64=('3672dcc860281832c2783e56a1276bf9')
md5sums_armv6h=('6ce2a80de7b67e56d93b0a0a982f8708')
md5sums_armv7h=('afb0a70fef8b0e66c9b2024f727dda48')
md5sums_aarch64=('047ac98c060764561da5a38619070209')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

