# Maintainer: Mort Yao <soi@mort.ninja>
pkgname=leiningen2-git
pkgver=20150609
pkgrel=1
pkgdesc="A build automation tool for the Clojure programming language."
arch=('any')
url="https://github.com/technomancy/leiningen"
license=('EPL')
depends=('clojure')
conflicts=('leiningen')

build() {
  cd ${srcdir}
  curl -olein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/bin/
  install -m755 -D lein ${pkgdir}/usr/bin/
}
