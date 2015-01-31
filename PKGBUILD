# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pep257
pkgver=0.4.1
pkgrel=1
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/GreenSteam/pep257"
license=('MIT')
depends=('python')
source=("https://github.com/GreenSteam/pep257/archive/${pkgver}.tar.gz")
sha1sums=('bc3142073b2ad99401488302e3ddd9dcfd73ffb1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
