# Maintainer: anekos <anekos@snca.net>

pkgname=grenchman
pkgver=0.2.0
pkgrel=1
pkgdesc="Grenchman lets you run Clojure code quickly."
arch=('any')
url="http://leiningen.org/grench.html"
license=('GPLv3')
depends=()
makedepends=()
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://technomancy.github.io/grenchman/downloads/grench-${pkgver}-fedora")
sha256sums=('616283a96685567a038af7d2ae20fe04df3a05010b7ad8ead8ed9f4402bc8b0d')

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 -T "grench-${pkgver}-fedora" "$pkgdir/usr/bin/grench"
}
