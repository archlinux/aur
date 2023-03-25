# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.8.7
pkgrel=2
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/latest/download/linux-generic.tar.gz")
sha512sums=('3cd241eefde603d7e8667b3c77decba57cb04036672d6909c671f15d66446f0e3e8dee3a2f8afdaa171db383f0ab358610c86a58205d52b176b6a0e0b68e18ac')

package() {
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
