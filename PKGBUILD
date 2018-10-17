# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
_pkgname=totp
pkgver=1.1.1
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://gitlab.com/hobarrera/totp-cli"
license=('MIT')
depends=("python-onetimepass" "pass" "python-setuptools")
source=("https://pypi.io/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('80eb432406835f4a0a71a29ebf99bc22')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
