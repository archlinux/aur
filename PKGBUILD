# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=4.2
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('2091e1372cc951781dadfd8be821e4ab4f67c2329033d3cd73e01fc0b40122ee90edfe536c43171edafe1cc7ce5faed0cff7f32c3a383986d8781997c22e5c09')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
