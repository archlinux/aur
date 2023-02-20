# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.25.2
pkgrel=1
pkgdesc="Offline documentation for the unstable version of lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
conflicts=('lilypond-docs')
provides=('lilypond-docs')
source=("https://gitlab.com/lilypond/lilypond/-/releases/v${pkgver}/downloads/lilypond-${pkgver}-documentation.tar.xz")
sha256sums=('99f98ef643eb775fc238e17ed5bcbc85a71887579b93f2e4d4e42ce435807ba4')

package(){
  install -d "$pkgdir"/usr
  cp -R "$srcdir"/share/ "$pkgdir"/usr/share/
}
