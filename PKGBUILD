# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
_pkgname=totp
pkgver=0.1.1
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://github.com/hobarrera/totp-cli"
license=('MIT')
depends=("python-onetimepass")
source=("https://pypi.python.org/packages/dd/c4/144cb2f741a5bb2b441a6a1585e745aa7e5080a48933f3986c4101bd0bb0/totp-0.1.1.tar.gz")
md5sum=('9d3543d4315e3377a246d77e381fe8b5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
md5sums=('9d3543d4315e3377a246d77e381fe8b5')
