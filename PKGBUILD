# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-argon2_cffi
pkgver=16.3.0
pkgrel=1
pkgdesc="The secure Argon2 password hashing algorithm."
arch=(any)
url="https://argon2-cffi.readthedocs.io/en/stable/"
license=('MIT')
depends=('python' 'python-cffi' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/argon2_cffi/argon2_cffi-${pkgver}.tar.gz")
md5sums=('85d3952536f2d697296cfdeb52cad8e0')

package() {
  cd "$srcdir/argon2_cffi-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
