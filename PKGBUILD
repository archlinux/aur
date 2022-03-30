# Maintainer: The-EDev <farook@the-e-dev.com>
pkgname=crow
pkgver=1.0+1
pkgrel=1
pkgdesc="A Fast and Easy to use C++ microframework for the web."
arch=(any)
url="https://crowcpp.org"
license=('custom:BSD-3-Clause')
depends=('boost>=1.64.0')
optdepends=('openssl: HTTPS support' 'zlib: HTTP compression support' 'cmake: Choose this if you plan on using CMake for your Crow project')
conflicts=("$pkgname-git")
changelog='changelog.md'
source=("https://github.com/CrowCpp/$pkgname/releases/download/v$pkgver/crow-v$pkgver.tar.gz")
md5sums=('732e91a304776f42523b479912283a53')
sha256sums=('59bbf2d098abf0cf2e878c83880fac6bd8b349c0b9eff8fed8304e1340abd3d6')

package() {
  echo "installing to \"$pkgdir/usr/local/\""
  mkdir -p "$pkgdir/usr/local/include"
  mkdir -p "$pkgdir/usr/local/lib"
  cp -r "include" "$pkgdir/usr/local"
  cp -r "lib" "$pkgdir/usr/local"
}
