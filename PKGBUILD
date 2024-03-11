# Maintainer: Thibaut CHARLES <cromfr@gmail.com>
pkgname='ci-toolbox-bin'
pkgver=8.4.2
pkgrel=1
pkgdesc="CI toolbox for Gitlab CI"
arch=('any')
url="https://gitlab.com/mbedsys/citbx4gitlab"
license=('GPL3')
depends=('bzip2' 'file' 'git' 'git-lfs' 'python-yaml' 'tar')
makedepends=()
optdepends=()
provides=('ci-toolbox')
conflicts=('ci-toolbox')
source=("https://gitlab.com/api/v4/projects/mbedsys%2fcitbx4gitlab/packages/generic/ci-toolbox/$pkgver/ci-toolbox-$pkgver.tar.xz")
sha256sums=('35f6ed1016124d4c5130e7985bfe0e2f73b49ada4ada44423ad04b4692f2e9cb')

package() {
    mkdir "$pkgdir/usr/"
    cp -R "$srcdir/"{bin,lib,share} "$pkgdir/usr/"
}
