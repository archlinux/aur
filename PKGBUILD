# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
pkgname=beamer-theme-torino
pkgver=0.1
pkgrel=3
pkgdesc="A pretty theme for LaTeX Beamer"
url="http://blog.barisione.org/2007-09/torino-a-pretty-theme-for-latex-beamer"
arch=("any")
license=("unknown")
depends=("texlive-basic")
source=("https://www.barisione.org/files/beamer-torino-0.1.tar.gz")
sha512sums=('86cf7ac94336e4a75e954087fd0d65b87793b341130d16589f87cbd0dc2ba2e6dffe74a364842a4c212fb02c04a7a2c485d154db67e3aedbe15bf409c12f6553')

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/{color,inner,outer,theme} 

  cd "$srcdir/beamer-torino"
  install -m644 beamercolorthemechameleon.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamercolorthemenouvelle.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamercolorthemefreewilly.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamerinnerthemefancy.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/inner/
  install -m644 beamerouterthemedecolines.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/outer/
  install -m644 beamerthemeTorino.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/
}
