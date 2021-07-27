# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=latex2e-help-texinfo
pkgname=('latex2e-help-texinfo' 'latex2e-help-texinfo-es')
pkgver=2021_07_25
pkgrel=1
pkgdesc="Inofficial LaTeX2e Reference Manual in info format"
url="https://ctan.org/pkg/latex2e-help-texinfo"
arch=('any')
license=('custom')
source=("http://mirrors.ctan.org/info/$pkgname.zip")
sha256sums=('e790527dea5cccc6ed369598591385832fe4e47b38630e6cd70685555373c939')

package_latex2e-help-texinfo() {
  cd $pkgname
  install -Dm644 latex2e.info "$pkgdir"/usr/share/info/latex2e.info
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/license
}

package_latex2e-help-texinfo-es() {
  cd ${pkgname%-es}/spanish
  install -Dm644 latex2e-es.info "$pkgdir"/usr/share/info/latex2e-es.info
}
