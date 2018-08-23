# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-mail-parser
pkgver=3.4.1
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://pypi.python.org/pypi/mail-parser
license=(Apache)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
source=(https://github.com/SpamScope/mail-parser/archive/v$pkgver.tar.gz)
sha512sums=('43771aa6948dd2b761aba99ccb36e8d0667a2545f835aa0a8c9222b5e66f07c5e992ada02e766102de6d23f785ac01152872550efe79be570fe07262621c069b')

package() {
  cd mail-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
