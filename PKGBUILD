# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
_pkgname=totp
pkgver=1.1.0
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://gitlab.com/hobarrera/totp-cli"
license=('MIT')
depends=("python-onetimepass")
source=("https://pypi.io/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e8ee5375a130c1341788cb54127c78ae')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
