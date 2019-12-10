# Maintainer: Davide Peressoni <davide dot peressoni at outlook dot com>

pkgname=latex-padova
pkgver=0.4
pkgrel=1
pkgdesc="Beamer theme of the University of Padua"
arch=(any)
url="https://andrea.burattin.net/stuff/tema-latex-beamer-padova/"
depends=('texlive-core')
provides=(pkgname)
conflicts=(pkgname)
install="${pkgname}.install"
source=('https://andrea.burattin.net/public-files/stuff/tema-latex-beamer-padova/beamer_padova-0.4.zip')
md5sums=('51195ecbf99f1c46ff04bf71eca3296a')

package() {
	cd "$srcdir"/beamer_padova-0.4/Padova
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/padova/images

  install -m644 images/* \
          "$pkgdir/usr/share/texmf-dist/tex/latex/padova/images/"

  install -m644 *.sty \
          "$pkgdir/usr/share/texmf-dist/tex/latex/padova/"
}
