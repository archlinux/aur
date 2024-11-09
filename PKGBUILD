# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

pkgname=jwt_tool
pkgver=2.2.7
pkgrel=1

pkgdesc='A toolkit for testing, tweaking and cracking JSON Web Tokens'
arch=('any')
url='https://github.com/ticarpi/jwt_tool'
license=('GPL-3.0-or-later')

depends=('python' 'python-termcolor' 'python-requests' 'python-pycryptodomex')
makedepends=()

# Hashes updated by updpkgsums
sha256sums=('78d63ba6cbab33f3d8233c1d657ee53e0f29d1d8a0b26a80bdc745e38d20f327')

source=("https://github.com/ticarpi/jwt_tool/archive/refs/tags/v$pkgver.zip")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
