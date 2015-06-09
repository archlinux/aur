# Maintainer: Alcasa

pkgname='python3-pyuserinput-git'
pkgver=184.97707fc
pkgrel=1
pkgdesc="A module for cross-platform control of the mouse and keyboard in python that is simple to install and use."
url="https://github.com/SavinaRoja/PyUserInput"
arch=('any')
license=('GPL3')
depends=('python3' 'python3-xlib')
source=('git+https://github.com/SavinaRoja/PyUserInput.git')

package() {
  cd PyUserInput
  python setup.py install --root="$pkgdir/"
}

pkgver() {
  cd PyUserInput
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
