# Maintainer Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.2.1
pkgrel=1
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://dangerzone.rocks/"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-click' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'podman')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/firstlookmedia/dangerzone/archive/v${pkgver}.tar.gz)
sha256sums=('d452dedd9a20d1f34b8e9e7a1eda69f84862ab4ef7c4c9eaa93bd7c7b8fb67f2')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
