# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.23.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.23.1/navidrome_0.23.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.23.1/navidrome_0.23.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.23.1/navidrome_0.23.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.23.1/navidrome_0.23.1_Linux_arm64.tar.gz')
md5sums_x86_64=('9ce7551838cfc2b50a464fe8cc951bb7')
md5sums_armv6h=('032533851c1df17ca99d2012fa587549')
md5sums_armv7h=('462034a935addcae274c5c05a8bd2bb4')
md5sums_aarch64=('3923b5d374571325625444f5e0281378')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"
}

