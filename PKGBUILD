# Maintainer: Juri Grabowski <gratuxri@gmail.com>

pkgname=kartina-tv-bin
pkgver=2.74
pkgrel=0
pkgdesc="iptv player for kartina.tv"
url=http://jo2003.github.io/vlc_record/
arch=(x86_64)
license=(GPL)
depends=()
provides=(kartina-tv)
conflicts=(kartina-tv-git)

source_x86_64=(http://firmware.kartina.tv/pc/linux/kartina_tv_2.74.1_20171117_amd64.deb)

sha512sums_x86_64=('098f54f579ee3571dc31753c408663e337a210f263fa1ee2db3903139b0a4ab6d694ddbd7de2a4d37f9bbcefd6eba5770bc39143e8578b12e7120ce6e6e93a78')


package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 ft=sh et:
