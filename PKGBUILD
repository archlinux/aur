# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-setuptools-rust
pkgver=0.11.6
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('python' 'python-setuptools' 'python-semantic-version' 'python-toml')
source=("$pkgname::git+https://github.com/PyO3/setuptools-rust.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
