# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
_pkgname=totp
pkgver=1.3.0
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://github.com/WhyNotHugo/totp-cli"
license=('MIT')
depends=("python-onetimepass" "pass" "python-setuptools")
source=("https://pypi.io/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9007bdd1ba11139918f33549965cf69f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
