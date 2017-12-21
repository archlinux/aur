# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.4.3
pkgrel=1
pkgdesc="Bash script that enables you to aggregate (tail/follow) logs from multiple pods into one stream"
arch=('any')
url="https://github.com/johanhaleby/kubetail"
license=('Apache')
depends=('kubectl-bin')
source=(https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz)
md5sums=('300ee2748f06f040522c44fbb2dcc367')

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 kubetail "$pkgdir/usr/bin/kubetail"
}

