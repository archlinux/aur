# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latex2e-help-texinfo  
pkgver=2016_04
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="http://home.gna.org/latexrefman/"
arch=('any')
license=('custom')
install=latex2e.install
source=(http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-es.info
	http://mirror.jmu.edu/pub/CTAN/info/latex2e-help-texinfo-fr/latex2e-fr.info
       http://mirror.unl.edu/ctan/info/latex2e-help-texinfo/README)
md5sums=('2c40633a08dfcbb4f1954f178a6e8c7b'
         '457214fce461228c5500fe998e9476ab'
         '38ee5b0fad6db14fc0394d3a404e62c0'
         'd9d4087ddae0795b6ace85f2958631c6')

package() {
  cd "$srcdir"
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
