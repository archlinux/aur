# Maintainer: Jingbei Li <i@jingbei.li>

pkgname=python-yubico-client
pkgver=1.13.0
pkgrel=1
pkgdesc="Python library for validating Yubico Yubikey One Time Passwords (OTPs) based on the validation protocol version 2.0."
arch=('any')
url="https://github.com/Kami/python-yubico-client"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('e9fab9971201eaef0f8bbf7bcc4badae')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
