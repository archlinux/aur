# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex2e-help-texinfo-fr  
pkgver=2020_09
pkgrel=2
pkgdesc="Inofficial LaTeX2e Reference Manual in info format - french"
url="https://ctan.org/pkg/latex2e-help-texinfo-fr"
arch=('any')
license=('custom')
source=("http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('960f94e8b1668abfd6716d6fb32989b8d4dcd1467b3ff6dbb5c2b48660383c62')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
