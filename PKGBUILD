# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit.com>
# Contributor: Daniel Kaes (daniel.kaes@web.de)

pkgname=wiki2beamer
pkgver=0.9.5
pkgrel=1
pkgdesc="wiki2beamer is a small tool to create LaTeX Beamer presentations from text files with a wiki-like syntax. Thus, it enables the user to create beamer presentations in a less time-consuming way."
url="http://wiki2beamer.sourceforge.net"
license=("GPL2")
depends=("python")
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/wiki2beamer/wiki2beamer/wiki2beamer-${pkgver}/wiki2beamer-${pkgver}.zip")
build() {
  cd ${srcdir}/${pkgname}-${pkgver}/code
  python setup.py install --root=${pkgdir}/
  mkdir -p ${pkgdir}/usr/man/man1
  cp ../doc/man/wiki2beamer.1 ${pkgdir}/usr/man/man1

}

sha1sums=('7fb3f480a8f26ca05b3709713b0f67b1b2e90653')
