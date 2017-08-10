# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex2e-help-texinfo-fr  
pkgver=2017_08
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format - french"
url="https://ctan.org/pkg/latex2e-help-texinfo-fr"
arch=('i686' 'x86_64')
license=('custom')
source=("http://mirrors.ctan.org/info/$pkgname.zip")
md5sums=('522e96cf8e4194dc0fd6d3fa3fb5d769')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
