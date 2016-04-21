# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python2-colorlog
pkgver=2.6.3
pkgrel=1
pkgdesc="Log formatting with colors"
arch=(any)
url="https://pypi.python.org/pypi/colorlog"
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
conflicts=(python2-colorlog-git)
# Not using $pkgver here as we need to update the whole hashed URL anyways...
source=("https://pypi.python.org/packages/cd/e7/7e14ce72038e83bc475a1f708485e5ea4a789beef26ff64b732918f860e6/colorlog-2.6.3.tar.gz")
md5sums=('7c80dc31fb37ae5f7d519b6796f7a7e0')

package() {
  cd "${srcdir}/colorlog-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh et sts=2 ts=2 tw=79
