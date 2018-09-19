# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-setuptools-rust
pkgver=0.10.5
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('python' 'python-setuptools' 'python-semantic-version')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/PyO3/setuptools-rust/archive/v$pkgver.tar.gz")
sha512sums=('a6514c316dfb83f857488740f588803f76fd6984bdf56efb621f635e8342a57c05a12db0f0a20df6f597eedce1619c13fc34ff83a33110136bcad18b4214f64a')

package() {
  cd setuptools-rust-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
