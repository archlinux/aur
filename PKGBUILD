# Maintainer: The-EDev <farook@the-e-dev.com>
pkgname=crow
pkgver=1.0+2
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
md5sums=('06670b110ee6aff107db734a98eeecd6')
sha256sums=('18d9a224ffb4d6dcba487d22d43751fe84f7dca2eb410a6acf6b1ce0be90ab55')

package() {
  echo "installing to \"$pkgdir/usr/local/\""
  mkdir -p "$pkgdir/usr/local/include"
  mkdir -p "$pkgdir/usr/local/lib"
  cp -r "include" "$pkgdir/usr/local"
  cp -r "lib" "$pkgdir/usr/local"
}
