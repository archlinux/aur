# Maintainer: Simon Doppler <dopsi@dopsi.ch>
pkgname=radicale-dovecot-auth
pkgver=0.2.1
pkgrel=2
pkgdesc="Dovecot auth for radicale"
arch=("any")
url="https://github.com/Arvedui/radicale-dovecot-auth"
license=('GPL')
depends=('python' 'radicale')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Arvedui/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('a4c0847a7a4b8d6b1ee45287953f8b9670fd1e99054d9592abd13780028c2d3e338cfb50412245b2e68cf7b62a3bc5f874b28cc867a3b8442ac8af1fe4dbbe39')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

