# Maintainer: archlinux.info:tdy
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-spotify
pkgver=2.2
pkgrel=1
pkgdesc="Spotify for Nuvola Player 3"
arch=(any)
url=https://github.com/tiliado/$pkgname
license=(BSD)
depends=(nuvolaplayer flashplayer gst-plugins-ugly gst-plugins-good)
makedepends=(scour)
conflicts=($pkgname-git)
source=(https://github.com/tiliado/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(ba719eaa61f01bf5a77e3be915b4f50b261e329743ff89c96596d993fb75bdb7)

package() {
  cd $pkgname-$pkgver
  make DEST="$pkgdir"/usr/share/nuvolaplayer3/web_apps install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
