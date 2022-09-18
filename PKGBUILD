# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.23.13
pkgrel=1
pkgdesc="Offline documentation for the unstable version of lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
conflicts=('lilypond-docs')
provides=('lilypond-docs')
source=("https://gitlab.com/lilypond/lilypond/-/releases/v${pkgver}/downloads/lilypond-${pkgver}-documentation.tar.xz")
sha256sums=('1cb56011bd02a9c6907d9b11fb773cb7c4303b66403429b03240d838e38af928')

package(){
  install -d "$pkgdir"/usr
  cp -R "$srcdir"/share/ "$pkgdir"/usr/share/
}

