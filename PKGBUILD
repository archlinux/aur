# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=4.6
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('cadd8e5338e339479e50d4588d161439cd8a29a6a6f46146605d1be7ea3657f38631137a41fa09e3374762160184e11058eab2a7209b230bc78918a00a9d0127')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
