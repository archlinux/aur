# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latex2e-help-texinfo  
pkgver=2015_10
pkgrel=2
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="http://home.gna.org/latexrefman/"
arch=('any')
license=('custom')
install=latex2e.install
source=(http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-es.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-fr.info
       http://mirror.unl.edu/ctan/info/latex2e-help-texinfo/README)
md5sums=('2c40633a08dfcbb4f1954f178a6e8c7b'
         '457214fce461228c5500fe998e9476ab'
         '161b884f26269335f9b2207f0e27e903'
         'd9d4087ddae0795b6ace85f2958631c6')

package() {
  cd "$srcdir"
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
