# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=python-glfw
pkgver=1.0.1
pkgrel=1
pkgdesc="A ctypes-based wrapper for GLFW3."
arch=('i686' 'x86_64')
url="https://github.com/FlorianRhiem/pyGLFW"
license=('MIT')
depends=('python>=3.0')
source=("https://pypi.python.org/packages/source/g/glfw/glfw-$pkgver.tar.gz")
md5sums=('0532a2a11705cddcc5da9ceb01bb8fc6')
 
package() {
  cd glfw-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
