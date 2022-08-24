# Maintainer: The-EDev <farook@the-e-dev.com>
pkgname=crow
pkgver=1.0+5
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
md5sums=('7e0664041a426a878f017c299975f7ef')
sha256sums=('0b996395a3411d970746eb953fa81e3dee3638bd587472ba28a9dbe8776c84c1')

package() {
  echo "installing to \"$pkgdir/usr/local/\""
  mkdir -p "$pkgdir/usr/local/include"
  mkdir -p "$pkgdir/usr/local/lib"
  cp -r "include" "$pkgdir/usr/local"
  cp -r "lib" "$pkgdir/usr/local"
}
