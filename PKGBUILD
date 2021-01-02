# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex2e-help-texinfo-fr  
pkgver=2020_12_30
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format - french"
url="https://ctan.org/pkg/latex2e-help-texinfo-fr"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('6929582a0fe0e0529e09b7790caf1935d4343cb49c951b53c92134dd57069447')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
