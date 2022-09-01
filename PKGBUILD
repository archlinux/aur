# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex2e-help-texinfo-fr  
pkgver=2022_08_29
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format - french"
url="https://ctan.org/pkg/latex2e-help-texinfo-fr"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('a354c72b62a849077ab184591aa89cb844821aeeeeb5bf2eb99986712a55f87a')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 latex2e-fr.info "$pkgdir"/usr/share/info/latex2e-fr.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}
