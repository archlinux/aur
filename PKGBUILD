# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Joel Almeida aullidolunar at gmai1 d0t k0m
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>

_pkgmajorver=2.28

pkgname=atk-docs
pkgver=${_pkgmajorver}.1
pkgrel=2
pkgdesc="Documentation for atk to be used in devhelp"
arch=('any')
license=('GPL')
url="http://library.gnome.org/devel/atk/stable/"
conflicts=('atk>=2.30.0')
source=(ftp://ftp.gnome.org/pub/gnome/sources/atk/${_pkgmajorver}/atk-${pkgver}.tar.xz)
sha256sums=('cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc')

package() {
	install -d "$pkgdir"/usr/share/devhelp/books/atk
  install -D -m 644 "$srcdir"/atk-${pkgver}/docs/html/* \
                    "$pkgdir"/usr/share/devhelp/books/atk
}
