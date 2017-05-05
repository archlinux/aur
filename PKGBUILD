# Maintainer: Juri Grabowski <gratuxri@gmail.com>

pkgname=kartina-tv-bin
pkgver=2.73
pkgrel=0
pkgdesc="iptv player for kartina.tv"
url=http://jo2003.github.io/vlc_record/
arch=(x86_64)
license=(GPL)
depends=()
provides=(kartina-tv)
conflicts=(kartina-tv-git)

source_x86_64=(http://www.kartina.tv/media/ktv_player/kartina_tv_2.73.0B11-20170214_amd64.deb)

md5sums_x86_64=('1aa80e4e53b7e3a61829c85b948cd66b')

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 ft=sh et:
