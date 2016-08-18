# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=wmix
pkgver=3.2
pkgrel=1
epoch=1
pkgdesc="Dockapp mixer for OSS or ALSA"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmix"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b3d00dadf6a2fc6d6b4ae9f870596ac')

build() {
  cd dockapps
  make
}

package() {
  cd dockapps
  install -Dm755 wmix "$pkgdir/usr/bin/wmix"
  install -Dm644 wmix.1x "$pkgdir/usr/share/man/man1/wmix.1"
}
