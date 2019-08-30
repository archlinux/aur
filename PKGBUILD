# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-setuptools-rust
pkgver=0.10.6
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('python' 'python-setuptools' 'python-semantic-version' 'python-toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyO3/setuptools-rust/archive/v$pkgver.tar.gz")
sha384sums=('f9c2f7b86c5b88abdf6bd162f2d80029639d0000744a6d830b3a7c63ad54f2571c70a95902b56abef1db390b3f24203f')

package() {
  cd setuptools-rust-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
