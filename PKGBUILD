# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
_gitrepository='portunus'
_gitbranch='master'
pkgname='portunus'
pkgver=2.04
pkgrel=1
pkgdesc='aggregates all package managers under one tool'
arch=('i686' 'x86_64')
url='https://github.com/andrei-pavel/portunus'
license=('MIT')
depends=('unp' 'yq')
makedepends=('git')
provides=('portunus')
source=("git+https://github.com/andrei-pavel/${_gitrepository}.git#branch=${_gitbranch}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitrepository}"
  ./install -p "${pkgdir}"
}
