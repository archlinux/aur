# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python2-colorlog
pkgver=2.7.0
pkgrel=1
pkgdesc="Log formatting with colors"
arch=(any)
url="https://pypi.python.org/pypi/colorlog"
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
conflicts=(python2-colorlog-git)
# Not using $pkgver here as we need to update the whole hashed URL anyways...
source=("https://pypi.python.org/packages/95/59/c70e535f1b3b8eab2279dc58dc5ce1a780eb83efccefa55ca745dc7f02ee/colorlog-2.7.0.tar.gz")
md5sums=('54709d93ee29bf61a2163e3019f4460e')

package() {
  cd "${srcdir}/colorlog-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh et sts=2 ts=2 tw=79
