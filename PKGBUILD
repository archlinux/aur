# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.3.1
pkgrel=1
pkgdesc="Bash script that enables you to aggregate (tail/follow) logs from multiple pods into one stream"
arch=('any')
url="https://github.com/johanhaleby/kubetail"
license=('Apache')
depends=('kubectl-bin')
source=(https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz)
md5sums=('460d9980033b22631fde19002537162f')

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 kubetail "$pkgdir/usr/bin/kubetail"
}

