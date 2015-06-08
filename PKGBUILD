# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latex2e-help-texinfo  
pkgver=2014_10
pkgrel=2
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="http://home.gna.org/latexrefman/"
arch=('any')
license=('custom')
install=latex2e.install
source=(http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-es.info
	http://svn.gna.org/viewcvs/*checkout*/latexrefman/trunk/latex2e-fr.info)
md5sums=('8b0e79299924c2e34d2a1f28cb1de5d5'
         'f4f17c578a9bdff0b926fd5008f4e99f'
         '3a5041779266173878b2ce7d7ce90e37')

package() {
  cd "$srcdir"
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
}
