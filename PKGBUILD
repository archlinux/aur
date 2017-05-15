# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python-camel
pkgver=v0.1.1
pkgrel=1
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python-yaml)
source=(git+https://github.com/eevee/camel.git#tag=${pkgver})
sha512sums=('SKIP')

package () {
  cd "$srcdir/camel"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
