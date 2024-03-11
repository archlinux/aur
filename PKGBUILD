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
source=("https://gitlab.com/mbedsys/citbx4gitlab/-/archive/$pkgver/citbx4gitlab-$pkgver.tar.bz2")
sha256sums=('c30d84a359ab07530fd44edcabc59f0d15d7f4b34098127030f224f2bd33f8fc')

package() {
    mkdir "$pkgdir/usr/"
    cp -R "$srcdir/"{bin,lib,share} "$pkgdir/usr/"
}
