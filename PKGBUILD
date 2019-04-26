# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=commit-patch
pkgver=2.6
pkgrel=1
pkgdesc="Commit partial patches to version control"
arch=('any')
url="http://www.porkrind.org/commit-patch/"
license=('GPL2')
depends=('perl' 'patch' 'patchutils' 'perl-ipc-run')
optdepends=('git' 'mercurial' 'subversion' 'cvs' 'darcs' 'bzr' 'monotone')
conflicts=()
provides=()
source=(http://www.porkrind.org/commit-patch/commit-patch-${pkgver}.tar.gz)
md5sums=('c5d8f9dc93676716445f3217a7ed25ee')

package() {
  cd "$srcdir"/commit-patch-${pkgver}

  make PREFIX="$pkgdir"/usr install
}
