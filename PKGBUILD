pkgname=asn1ify
pkgver=0.0.1
pkgrel=1
pkgdesc="Transform classic path to ASN.1-like path."
arch=('x86_64')
url="https://github.com/ryfax/${pkgname}"
license=('MIT')
depends=('bash')
source=("https://github.com/ryfax/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c048445b16cc7feea00622734b663dab')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}
