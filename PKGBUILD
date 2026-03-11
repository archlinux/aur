# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.1.1
pkgrel=1
pkgdesc="Live synced lyrics in your terminal, pulled from Spotify"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('MIT')
depends=('python' 'python-spotipy' 'python-pillow' 'python-colorthief')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vlensys/lyricspot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('342ec482ba2a468451e600f3e18ed9c61d35f3d4fa046920afa383a28a1546a4')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lyricspot.py "$pkgdir/usr/bin/lyricspot"
}
