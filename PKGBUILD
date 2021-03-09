# Maintainer: Matei Cotocel <mcotocel at outlook dot com>
pkgname=discocss-git
pkgver=v0.1.0.r1.g764db56
pkgrel=1
pkgdesc="A tiny Discord CSS injector"
arch=('any')
url="https://github.com/mlvzk/discocss"
license=('MPL2')
groups=()
makedepends=('git')
source=("git+https://github.com/mlvzk/discocss")
md5sums=('SKIP')

pkgver() {
  cd discocss
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd discocss
	install -Dm775 discocss "${pkgdir}"/usr/bin/discocss
}
