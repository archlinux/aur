# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=py-trello
pkgver=0.9.0
pkgrel=1
pkgdesc="Python wrapper around the Trello API"
arch=(any)
url="https://github.com/sarumont/py-trello"
license=("BSD")
depends=("python-requests-oauthlib" "python-dateutil" "python-pytz")
source=("https://github.com/sarumont/py-trello/archive/${pkgver}.tar.gz")
md5sums=('73b6c8df079d0ed40edc5a5d5060f6eb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
