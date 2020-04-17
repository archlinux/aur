# Maintainer: morguldir <morguldir@protonmail.com>
_gitname=PyTMX
pkgname=python-pytmx
pkgver=3.20.17
pkgrel=1
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/$_gitname"
license=('LGPL')
depends=('python>=3.3' 'python-six')
makedepends=('git')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://github.com/bitcraft/$_gitname.git#commit=1896511afff65b5a5eb18295976ec44b68a9bb5a")
sha256sums=('SKIP')

package(){
  cd $_gitname
  python setup.py install --root="$pkgdir" --prefix=/usr
}
