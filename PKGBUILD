# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.8.7
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/latest/download/linux-generic.tar.gz")
sha512sums=('dd18a6009ffb2c798f201dc6e87d0af852138e0e6e180fe55afb0c8524c4f13afa04f1f9c2949decebb41fbacd6a6b8ad15ac5ef51bbcb0e9a533043a7cce425')

package() {
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
