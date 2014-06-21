# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=dsmidiwifi-cli
pkgver=1.1
pkgrel=1
pkgdesc="DSMI Server with GUI Removed"
url="http://github.com/ids1024/dsmidiwifi-cli"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('alsa-lib')
source=("https://github.com/ids1024/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('bf1b79ac3e7cb5f5c32f18f8cc1d436f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 dsmidiwifi-cli $pkgdir/usr/bin/dsmidiwifi-cli
}

# vim:set ts=2 sw=2 et:
