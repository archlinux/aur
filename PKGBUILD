# Maintainer: Alcasa

pkgname='python3-pyscreenshot-git'
pkgver=89.a813a54
pkgrel=1
pkgdesc="Pyscreenshot tries to allow to take screenshots without installing 3rd party libraries"
url="https://github.com/ponty/pyscreenshot"
arch=('any')
license=('GPL3')
depends=('python3' 'python-pillow' 'pygtk')
source=('git+https://github.com/ponty/pyscreenshot.git')

package() {
  cd pyscreenshot
  python setup.py install --root="$pkgdir/"
}

pkgver() {
  cd pyscreenshot
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
