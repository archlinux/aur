# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.1.1
pkgrel=1
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF."
url="https://dangerzone.rocks/"
arch=('any')
license=('MIT')
depends=('python-qtpy' 'python-appdirs' 'python-click' 'python-pyxdg' 'python-requests' 'docker')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/firstlookmedia/dangerzone/archive/v${pkgver}.tar.gz)
sha256sums=('4b7698a52e7ecd192fc733703f24d482de6e6c98ed3bc019a1a75dbe6966eeee')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
