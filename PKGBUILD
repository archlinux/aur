# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pep257
pkgver=0.5.0
pkgrel=1
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/GreenSteam/pep257"
license=('MIT')
depends=('python')
source=("https://github.com/GreenSteam/pep257/archive/${pkgver}.tar.gz")
sha1sums=('588ed2a6398da44e97256dbf64740abc0000aeba')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
