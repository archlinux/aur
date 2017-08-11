# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex2e-help-texinfo-fr  
pkgver=2017_08
pkgrel=2
pkgdesc="Inofficial LaTeX2e Reference Manual in info format - french"
url="https://ctan.org/pkg/latex2e-help-texinfo-fr"
arch=('i686' 'x86_64')
license=('custom')
source=("http://mirrors.ctan.org/info/$pkgname.zip")
md5sums=('d5bba6db01ce3e19476ce6271aa27d95')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
