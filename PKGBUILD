# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-colorlog
pkgver=2.6.0
pkgrel=1
pkgdesc="Log formatting with colors"
arch=(any)
url="https://pypi.python.org/pypi/colorlog"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
conflicts=(python-colorlog-git)
source=("http://pypi.python.org/packages/source/c/colorlog/colorlog-${pkgver}.tar.gz")
sha1sums=('8a05deaa52fc8233a9f0ea013a23a346feef41b7')

package() {
  cd "${srcdir}/colorlog-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh et sts=2 ts=2 tw=79
