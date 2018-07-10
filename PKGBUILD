# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=latex2e-help-texinfo
pkgname=('latex2e-help-texinfo' 'latex2e-help-texinfo-es')
pkgver=2018_07_03
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="https://ctan.org/pkg/latex2e-help-texinfo"
arch=('any')
license=('custom')
source=("http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('23f731f59c45d0771b3ef1cbb32831c428307497ffaa3a9d8c12fd070d7aa549')

package_latex2e-help-texinfo() {
  cd $pkgname
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}

package_latex2e-help-texinfo-es() {
  cd ${pkgname%-es}/spanish
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
}
