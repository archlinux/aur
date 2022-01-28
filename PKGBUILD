# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=latex2e-help-texinfo
pkgname=('latex2e-help-texinfo' 'latex2e-help-texinfo-es')
pkgver=2022_01_26
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="https://ctan.org/pkg/latex2e-help-texinfo"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('7fda8a7d0a3a01988e51b2b0b7947d2d677b33234da200c14edac88c2f07db6f')

package_latex2e-help-texinfo() {
  cd $pkgname
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}

package_latex2e-help-texinfo-es() {
  cd ${pkgname%-es}/spanish
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
}
