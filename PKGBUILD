# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.38.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.38.0/navidrome_0.38.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.38.0/navidrome_0.38.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.38.0/navidrome_0.38.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.38.0/navidrome_0.38.0_Linux_arm64.tar.gz')
md5sums_x86_64=('f30a9afbb3441bffe83e6547964c2f1e')
md5sums_armv6h=('42a920c330df60109562c41f7a211c95')
md5sums_armv7h=('7730d53d4f25fbd46e47930a07c44ad6')
md5sums_aarch64=('6683c9507b73c9397e106d2b5578758b')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

