# Maintainer Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.3
pkgrel=1
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://dangerzone.rocks/"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-click' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'podman')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/firstlookmedia/dangerzone/archive/v${pkgver}.tar.gz)
sha256sums=('4a2f7950984746fc40d8870b44f49a4cb577677934649f634f4463ab5f92ee91')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
