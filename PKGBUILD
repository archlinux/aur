# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latex2e-help-texinfo  
pkgver=2016_11
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="http://home.gna.org/latexrefman/"
arch=('any')
license=('custom')
source=(http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-es.info
	http://mirror.jmu.edu/pub/CTAN/info/latex2e-help-texinfo-fr/latex2e-fr.info
       http://mirror.unl.edu/ctan/info/latex2e-help-texinfo/README)
md5sums=('f0fad43bcaf1a87a8f604b34deb60972'
         '457214fce461228c5500fe998e9476ab'
         'e04a39add0b4e40362227115992d9e0e'
         'd9d4087ddae0795b6ace85f2958631c6')

package() {
  cd "$srcdir"
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
