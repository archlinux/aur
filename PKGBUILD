# Maintainer: fennecFactor <fennecfactor at protonmail dot com>
pkgname=mir.qualia
pkgver=2.0.0
pkgrel=1
pkgdesc="Automatically comment and uncomment config file sections"
arch=('any')
url="https://github.com/darkfeline/mir.qualia"
license=('Apache')
depends=('python' 'python-setuptools')
makedepends=()
source=('https://github.com/darkfeline/mir.qualia/archive/v2.0.0.tar.gz')
md5sums=('1cc8feffacd1898ba338956ad80c30f0')

build() {
  cd "$pkgname-$pkgver"
  python3 setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python3 setup.py check
}

package() {
  cd "$pkgname-$pkgver"
  python3 setup.py install --single-version-externally-managed --optimize 01 --root="$pkgdir/" --prefix=/usr

}
