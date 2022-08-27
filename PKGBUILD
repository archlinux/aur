# Maintainer: The-EDev <farook@the-e-dev.com>
pkgname=crow
pkgver=1.0+5
pkgrel=2
pkgdesc="A Fast and Easy to use C++ microframework for the web."
arch=(any)
url="https://crowcpp.org"
license=('custom:BSD-3-Clause')
depends=('boost>=1.64.0')
optdepends=('openssl: HTTPS support' 'zlib: HTTP compression support' 'cmake: Choose this if you plan on using CMake for your Crow project')
conflicts=("$pkgname-git")
changelog='changelog.md'
source=("https://github.com/CrowCpp/$pkgname/releases/download/v$pkgver/crow-v$pkgver.tar.gz")
md5sums=('9cc31cefd97e2ddbb8df77a2fe84d29a')
sha256sums=('c299e8ac6c4286139ba14dc9555db9f15902182a2ddcb1e25ca0984f67152877')

package() {
  echo "installing to \"$pkgdir/usr/local/\""
  mkdir -p "$pkgdir/usr/local/include"
  mkdir -p "$pkgdir/usr/local/lib"
  cp -r "include" "$pkgdir/usr/local"
  cp -r "lib" "$pkgdir/usr/local"
}
