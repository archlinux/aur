# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 

pkgname=inkslides-git
pkgdesc="Forked and improved version of inkscapeslide-git"
pkgver=r25.8e77203
pkgrel=1
arch=('i686' 'x86_64')
license=('mit')
depends=('python' 'inkscape' 'python-lxml')
makedepends=('git')
conflicts=('')
url="https://github.com/janoliver/inkslides.git"
source=('git+https://github.com/janoliver/inkslides.git')
_gitname="inkslides"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 inkslides.py "${pkgdir}/usr/bin/inkslides"
} 
