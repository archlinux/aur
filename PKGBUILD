# Maintainer: luxcem <a@luxcem.fr>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-myrica
pkgver=2.012.20180119
pkgrel=1
pkgdesc="Japanese font family for developers obtained by mixing Inconsolata and Genshin Gothic"
url="https://myrica.estable.jp/"
license=("Apache" "custom:OFL")
arch=("any")
source=("https://github.com/tomokuni/Myrica/raw/master/product/Myrica.zip")
sha256sums=("189698851150814728a093830dd61b685dd98a01f29e36738d9271420726202b")

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.TTC "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
