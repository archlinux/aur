# Maintainer: Neil Santos <nsantos16+aur@gmail.com>

pkgname=bzrlog
pkgver=1.1
pkgrel=1
pkgdesc='Log oriented GUI for Bazaar VCS'
arch=('i686' 'x86_64')
url='http://lacl.univ-paris12.fr/pommereau/soft/bzrlog/index.html'
license=('GPL')
depends=('bzr' 'pygtk' 'bzr-gtk')
source=('http://lacl.univ-paris12.fr/pommereau/soft/bzrlog/BzrLog-1.1.tar.gz')
md5sums=('87b10a940cd74009438754a3a0ebf0f6')

build() {
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/BzrLog-$pkgver/bzrlog  $pkgdir/usr/bin/bzrlog
}
