# Author: mosra <mosra@centrum.cz>
pkgname=kubedecode-git
pkgver=1.5
pkgrel=1
pkgdesc="Kubedecode decodes all parts of a Kubernetes secret, no more copypasting!"
arch=('any')
url="https://github.com/mschmidt291/kubedecode"
license=('MIT')
depends=('kubectl')
makedepends=('bash' 'git')
provides=('kubedecode-git')
conflicts=('kubedecode-git')
source=("https://github.com/mschmidt291/kubedecode/archive/v$pkgver.tar.gz")
sha1sums=('SKIP')

package() {
  cd $srcdir/kubedecode-$pkgver/bin
  install -Dm755 "kubedecode" "${pkgdir}/usr/local/bin/kubedecode"
}
