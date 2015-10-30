# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latex2e-help-texinfo  
pkgver=2015_10
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="http://home.gna.org/latexrefman/"
arch=('any')
license=('custom')
install=latex2e.install
source=(http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-es.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-fr.info)
md5sums=('f05c5f88e0ddd078e62790a94374c3f2'
         '457214fce461228c5500fe998e9476ab'
         '161b884f26269335f9b2207f0e27e903')

package() {
  cd "$srcdir"
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
}
