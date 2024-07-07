# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=boxflat
pkgname=boxflat-git
pkgver=0.0.1.r0.g17e3203
pkgrel=1
pkgdesc="Adjust your Moza Racing gear settings"
arch=('x86_64')
url="https://github.com/Lawstorant/boxflat"
license=('GPL3')
depends=(
	python
	python-yaml
	python-gobject
	python-cairo
	gtk4
	libadwaita
	udev
)
makedepends=(
  git
)
source=(
  git+https://github.com/Lawstorant/boxflat
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
  
package() {
  cd "$srcdir/$_reponame"
  ls 
  ./install.sh
}
