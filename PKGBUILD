# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

pkgname=jwt_tool
pkgver=2.3.0
pkgrel=1

pkgdesc='A toolkit for testing, tweaking and cracking JSON Web Tokens'
arch=('any')
url='https://github.com/ticarpi/jwt_tool'
license=('GPL-3.0-or-later')

depends=('python' 'python-termcolor' 'python-requests' 'python-pycryptodomex' 'python-ratelimit')
makedepends=()

# Hashes updated by updpkgsums
sha256sums=('03aa6c5b41e8bcfff2dd983592ddc46b4557894934b234bc682edd2869434f80')

source=("https://github.com/ticarpi/jwt_tool/archive/refs/tags/v$pkgver.zip")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
