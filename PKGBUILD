# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pep257
pkgver=0.3.2
pkgrel=1
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/GreenSteam/pep257"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=("https://github.com/GreenSteam/pep257/archive/${pkgver}.tar.gz")
sha1sums=('363975b48588604e206204e9b41e305029b0f214')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
