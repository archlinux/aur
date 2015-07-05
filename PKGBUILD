# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
pkgname=beamer-theme-torino
pkgver=0.1
pkgrel=2
pkgdesc="A pretty theme for LaTeX Beamer"
url="http://blog.barisione.org/2007-09/torino-a-pretty-theme-for-latex-beamer"
arch=("any")
license=("unknown")
depends=("texlive-core")
source=("http://marcobari.altervista.org/av/beamer-torino-0.1.tar.gz")
sha512sums=('575c0c11a1cfcbf5d4af446b48c755655c0e0ca25312c22f5a734e64b6b0372c8ab7f5e33f87435b99f75d3e4d8518fed2370a83c2d22cc2ac9d77e86bdd77b2')

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/{color,inner,outer,theme} 

  cd "$srcdir/beamer-torino-$pkgver"
  install -m644 beamercolorthemechameleon.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamercolorthemenouvelle.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamercolorthemefreewilly.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamerinnerthemefancy.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/inner/
  install -m644 beamerouterthemedecolines.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/outer/
  install -m644 beamerthemeTorino.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/
}
