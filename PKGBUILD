# Maintainer: Alex Kubica <alexkubicail@gmail.com>
# Contributor: Manoel Vilela <manoel_vilela@engineer.com>
_name=mal
_tag=v0.4.0
pkgname=python-mal-git
pkgver=0.4.0
pkgrel=3
pkgdesc="MyAnimeList command line interface"
arch=(any)
url="http://lerax.me/MAL/"
license=('GPL3')
depends=('python' 'python-requests' 'python-appdirs' 'python-decorating')
makedepends=('git')
source=("git+https://github.com/ryukinix/${_name}.git#tag=${_tag}")
md5sums=('SKIP')

package() {
  cd "$srcdir/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
