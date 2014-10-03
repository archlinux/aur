# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python2-colorlog
pkgver=2.0.0
pkgrel=1
pkgdesc="Log formatting with colors"
arch=(any)
url="https://pypi.python.org/pypi/colorlog"
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
conflicts=(python2-colorlog-git)
source=("http://pypi.python.org/packages/source/c/colorlog/colorlog-${pkgver}.tar.gz")
md5sums=('d6c33ae5e2a832f32a0730d2a08a3343')

package() {
  cd "${srcdir}/colorlog-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh et sts=2 ts=2 tw=79
