# Maintainer: David Stark <david@starkers.org>

pkgname=telepresence
pkgver=0.61
pkgrel=1
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster - http://www.telepresence.io"
arch=('any')
license=('GPL3')
url="https://github.com/datawire/telepresence"
depends=('python')
makedepends=('git')
source=("$pkgname::git+https://github.com/datawire/telepresence.git")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --tags
}

package(){
  install -Dm 755 "$srcdir/telepresence/cli/telepresence" "$pkgdir/usr/bin/telepresence"
}
