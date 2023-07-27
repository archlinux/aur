# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=4.0
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('6c8fc9de1d61ddaafbc86f4b1c0075264411e3664b6223abd8c5f4a91a01f5e59c8da67b5562db3bc6cea093904839f0f329597a037f042808f1d14e48b8d3d5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
