# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-colorlog
pkgver=2.4.0
pkgrel=1
pkgdesc="Log formatting with colors"
arch=(any)
url="https://pypi.python.org/pypi/colorlog"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
conflicts=(python-colorlog-git)
source=("http://pypi.python.org/packages/source/c/colorlog/colorlog-${pkgver}.tar.gz")
sha1sums=('30b4a621ec372ba4ab367cb5446a4a4293f6e9ed')

package() {
  cd "${srcdir}/colorlog-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh et sts=2 ts=2 tw=79
