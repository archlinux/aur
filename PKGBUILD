# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
_pkgname=totp
pkgver=1.2.0
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://gitlab.com/hobarrera/totp-cli"
license=('MIT')
depends=("python-onetimepass" "pass" "python-setuptools")
source=("https://pypi.io/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ec2ae39d309a9997016d0ce011ab91e2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
