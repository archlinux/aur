# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
pkgname=pep257
pkgver=0.6.0
pkgrel=3
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/GreenSteam/pep257"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/GreenSteam/pep257/archive/${pkgver}.tar.gz")
sha1sums=('ce49ab0b11a3d8652098a90c505ccbb4aac5d346')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
