# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=python-u2flib-host
pkgver=3.0.3
pkgrel=2
pkgdesc='Python-based U2F host library by Yubico'
arch=(any)
url='https://github.com/Yubico/python-u2flib-host'
license=('BSD')
depends=('python' 'python-hidapi')
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Yubico/python-u2flib-host/releases/download/python-u2flib-host-${pkgver}/python-u2flib-host-${pkgver}.tar.gz")
sha256sums=('ab678b9dc29466a779efcaa2f0150dce35059a7d17680fc26057fa599a53fc0a')


package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
