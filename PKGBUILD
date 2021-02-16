# Maintainer: Juri Grabowski <gratuxri@gmail.com>

pkgname=kartina-tv-bin
pkgver=2.11.5
pkgrel=0
epoch=1
pkgdesc="iptv player for kartina.tv"
url=http://jo2003.github.io/vlc_record/
arch=(x86_64)
license=(GPL)
depends=()
provides=(kartina-tv)
conflicts=(kartina-tv-git)

source_x86_64=(https://www.kartina.tv/media/ktv_player/kartina.tv_2.11.5_amd64.deb)

sha512sums_x86_64=('f387682e9d33d41aa6fed2e48bb3f2d1205a2e9e8b1098a7f923ce94ad964eafb98e30a576eb0015908a11c6cd15b3507452f185237d899fc71e84d82788093c')


package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 ft=sh et:
