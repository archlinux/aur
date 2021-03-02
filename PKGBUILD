# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.4
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip)
sha512sums=('85813480df96e4153878019b4456ad02ef7f5ea1193d0f16e51e96e37df7e393fd5a962fc75ea9c0ebd60ccff92bce7c441121bd144a3d79b363c06d200d7fa2')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
}
