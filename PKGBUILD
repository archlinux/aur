# Maintainer: Thibaut CHARLES <cromfr@gmail.com>
pkgname='ci-toolbox-bin'
pkgver=8.3.0
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
sha256sums=('e95100f4a0061f40088c36e5a40d625105b21e17e83ab604cf77b0590b1ea41d')

package() {
    mkdir "$pkgdir/usr/"
    cp -R "$srcdir/"{bin,lib,share} "$pkgdir/usr/"
}
