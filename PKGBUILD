# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='cmdtools-git'
reponame='cmdtools'
pkgver=1.0.1
pkgrel=1
pkgdesc="Tools to manipulate, create, and view commands."
arch=('any')
url="https://github.com/binex-dsk/cmdtools"
license=('GPL3')
source=("git+https://github.com/binex-dsk/cmdtools.git")
makedepends=('bash')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$reponame
  git describe --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd $srcdir/$reponame
	bash install.sh
}
