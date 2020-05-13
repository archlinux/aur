# Maintainer: Hoeman <dickespamadresse@gmail.com>

pkgname=latex-urcls
pkgver=2.1
pkgrel=1
pkgdesc='Beamer and scrlttr2 classes and styles for the University of Regensburg'
arch=('any')
url='https://github.com/TeXhackse/urcls'
license=('custom')
depends=()
makedepends=('zip')
source=("https://github.com/TeXhackse/urcls/archive/v${pkgver}.tar.gz")
b2sums=('ad0c2c4a42d826dff6837943a54a22dd3b22733b8c94f88ea49d2c9cc2532b4795a2b826db44d21650bbca47c8853f59a67d3b5fefcda9c63f8b2d8602d5800e')

package() {
  cd urcls-${pkgver}
  mkdir -p "${pkgdir}"/usr/share/texmf/tex/latex/urcls
  cp -r tex "${pkgdir}"/usr/share/texmf/tex/latex/urcls
  mkdir -p "${pkgdir}"/usr/share/texmf/doc/latex/urcls
  cp -r example "${pkgdir}"/usr/share/texmf/doc/latex/urcls
}
