# Maintainer: Fernando Basso <fernandobasso.br@gmail.com>

pkgname='replit-desktop-bin'
pkgver=1.0.5
pkgrel=1
pkgdesc='Replit desktop application'
arch=('x86_64')
url='https://desktop.replit.com/download'
license=('MIT')
depends=('libarchive' 'binutils')
provides=('replit')
source=("replit-desktop-${pkgver}.deb::$url/deb")
sha256sums=('fdb60274b7b81b465d5e3d2cd6ad028c8f53d0f837745bfd1aaf2b110d7da49f')

prepare() {
  ar xv replit-desktop-1.0.5.deb
  bsdtar xf data.tar.zst
}

package() {
  mv -v usr "$pkgdir"
}
