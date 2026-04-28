# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=edconv-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="An intuitive FFmpeg GUI"
arch=('x86_64')
url="https://github.com/edneyosf/Edconv"
license=('GPL-2.0-only')
depends=('ffmpeg' 'gtk3' 'glib2')
makedepends=('libarchive')
optdepends=('desktop-file-utils: for updating desktop database')
source=("https://github.com/edneyosf/Edconv/releases/download/${pkgver}/Edconv-${pkgver}-x86_64.deb")
sha256sums=('dc8adc0b9149a69d02fd62cc51dabb9fee23e38e7b7fc863bd741f7cab01d70a')

_ghrepo="edneyosf/Edconv"

package() {
  cd "$srcdir"

  bsdtar -xf "Edconv-${pkgver}-x86_64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
