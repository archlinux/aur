# Maintainer: morguldir <morguldir@protonmail.com>
_gitname=PyTMX
pkgname=python-pytmx
pkgver=3.24
_commit=eb96efea30d57b731654b2a167d86b8b553b147d
pkgrel=1
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/$_gitname"
license=('LGPL')
depends=('python>=3.3' 'python-six')
makedepends=('git')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://github.com/bitcraft/$_gitname.git#commit=$_commit")
sha256sums=('SKIP')

package(){
  cd $_gitname
  python setup.py install --root="$pkgdir" --prefix=/usr
}
