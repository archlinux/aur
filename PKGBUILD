# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=py-trello
pkgver=0.6.1
pkgrel=1
pkgdesc="Python wrapper around the Trello API"
arch=(any)
url="https://github.com/sarumont/py-trello"
license=("BSD")
depends=("python-requests-oauthlib" "python-dateutil" "python-pytz")
source=("https://github.com/sarumont/py-trello/archive/${pkgver}.tar.gz")
md5sums=('115e251abf1b00c4aaef9d01ceea0370')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
