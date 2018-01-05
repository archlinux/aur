# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>

pkgname=atk-docs
pkgver=2.6.0
pkgrel=2
pkgdesc="Documentation for atk to be used in devhelp"
arch=('any')
license=('GPL')
url="http://library.gnome.org/devel/atk/stable/"
source=(ftp://ftp.gnome.org/pub/gnome/sources/atk/2.6/atk-${pkgver}.tar.xz)
md5sums=('6b34e2a63dda4429b5692be7ca3aa5bf')

package() {
  install -d "$pkgdir"/usr/share/devhelp/books/atk
  install -D -m 644 "$srcdir"/atk-${pkgver}/docs/html/* \
                    "$pkgdir"/usr/share/devhelp/books/atk
}
