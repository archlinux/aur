# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
pkgname=pep257
pkgver=0.7.0
pkgrel=2
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/GreenSteam/pep257"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/GreenSteam/pep257/archive/${pkgver}.tar.gz")
sha1sums=('dbaef42578be3c3ea504d58fa197c73d6c04e217')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
