# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=py-trello
pkgver=0.4.3
pkgrel=1
pkgdesc="Python wrapper around the Trello API"
arch=(any)
url="https://github.com/sarumont/py-trello"
license=("BSD")
depends=("python-requests-oauthlib" "python-dateutil")
source=("https://github.com/sarumont/py-trello/archive/0.4.3.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
md5sums=('cbc966b6e533a140ad4fe746e27f79e3')
