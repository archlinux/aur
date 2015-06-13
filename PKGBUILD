# Maintainer: shmilee <shmilee[dot]zju[at]gmail[dot]com>

pkgname=python3-keybinder
pkgver=1.1.2
pkgrel=2
pkgdesc='python 3 global keybinding library for X.'
arch=(any)
url='https://github.com/LiuLang/python3-keybinder'
license=('GPLv3')
depends=('python-xlib')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('4ba45929a597a3fb623ea33e4fca1300ed1de2da917325a82b9b5f46504e8e4f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"  
}
