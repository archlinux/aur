# Maintainer: Darrell Enns <darrell@darrellenns.com>

# Todo: chown/chgrp http webapps dir

pkgname=gallery2
pkgver=2.3.2
pkgrel=1
pkgdesc="Open source web based photo album organizer."
arch=('i686' 'x86_64')
url="http://galleryproject.org/"
license=('GPL')
depends=('php' 'mariadb')
source=(http://downloads.sourceforge.net/gallery/gallery-$pkgver-full.zip)
sha512sums=('601b67822e633214258484ed87ca4d088babe3d04895f192fcbed94733eef93509d651cdc17fe670705100ba17435daa772f1aaee4965627ed583789afaae6f7')

install=$pkgname.install

package() {
  mkdir -p "$pkgdir/usr/share/webapps"
  cp -a "$srcdir/gallery2" "$pkgdir/usr/share/webapps/"
}
