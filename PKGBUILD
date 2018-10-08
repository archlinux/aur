# Maintainer: Victor Demonchy <demonchy.v@gmail.com>

pkgname=kubetail
pkgver=1.6.4
pkgrel=1
pkgdesc="Bash script that enables you to aggregate (tail/follow) logs from multiple pods into one stream"
arch=('any')
url="https://github.com/johanhaleby/kubetail"
license=('Apache')
depends=('kubectl-bin')
source=(https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz)
md5sums=('a9f387533b6e16b8e223e3324aa4ec9b')

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 kubetail "$pkgdir/usr/bin/kubetail"
}

