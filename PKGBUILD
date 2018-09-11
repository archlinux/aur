# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-setuptools-rust
pkgver=0.10.3
pkgrel=2
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('python' 'python-setuptools' 'python-semantic-version')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/PyO3/setuptools-rust/archive/v$pkgver.tar.gz")
sha512sums=('cb540ff97034a01f14739953eb9174ffc865f4e64589839dad2576f536e36aecfad3464aa9d53cb9db72406d30649b246af6c89b96dc4e9d04fd444490212941')

package() {
  cd setuptools-rust-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
