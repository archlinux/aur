# Maintainer: The-EDev <farook@the-e-dev.com>
pkgname=crow
pkgver=1.0+3
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
md5sums=('9e5bbbf5e32a12f547268da7579b00bd')
sha256sums=('49e6e1162457cd4da49da76c50af3e725d6f7d1f4698bef44d65563f06514fa4')

package() {
  echo "installing to \"$pkgdir/usr/local/\""
  mkdir -p "$pkgdir/usr/local/include"
  mkdir -p "$pkgdir/usr/local/lib"
  cp -r "include" "$pkgdir/usr/local"
  cp -r "lib" "$pkgdir/usr/local"
}
