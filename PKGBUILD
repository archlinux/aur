# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python-camel
pkgver=v0.1.r12.g7e2c6b7
pkgrel=1
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python-yaml)
source=('git+https://github.com/eevee/camel.git#commit=7e2c6b7bf965c4e9d098d6c56594ca2c36b63aa8')
sha512sums=('SKIP')

package () {
  cd "$srcdir/camel"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
