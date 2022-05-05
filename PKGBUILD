# Maintainer: Joseph Diza <josephm.diza@gmail.com>

pkgname=python-clopy-git
pkgver=0.1.13
pkgrel=1
arch=('any')
pkgdesc=' An all purpose general templating program, and project starter program.' 
url='https://github.com/jmdaemon/clopy'
license=('GPL')
depends=('python-jinja' 'python-wora' 'python-plumbum')
optdepends=()
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/jmdaemon/clopy#branch=master")
provides=(python-clopy)
conflicts=(python-clopy)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root "$pkgdir" --optimize=1
}
