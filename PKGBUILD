# Maintainer: Simon Doppler <dopsi@dopsi.ch>
pkgname=radicale-dovecot-auth
pkgver=0.3.0
pkgrel=2
pkgdesc="Dovecot auth for radicale"
arch=("any")
url="https://github.com/Arvedui/radicale-dovecot-auth"
license=('GPL')
depends=('python' 'radicale')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Arvedui/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('336d234a85710bd281f8b9c0035b27bd680f75fc337c330e2e13121f588ec8295a7c690b18ae1f16e20da4127729a2d1a5f9da5419f1a71ff7679ec9d21b2d0f')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
