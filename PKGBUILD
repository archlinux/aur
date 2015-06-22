# Maintainer: Samo Turk <samo.turk@gmail.com>
pkgname=chembl_webresource_client-git
pkgver=0.8.6
pkgrel=1
pkgdesc="A python client for accessing ChEMBL web services"
arch=('any')
url="https://github.com/chembl/chembl_webresource_client.git"
license=('CCPL')
groups=()
depends=('python2' 'python2-requests' 'python2-grequests' 'python2-requests-cache' 'python2-easydict' 'python2-pytest' 'python2-six' 'python2-urllib3' 'python2-ndg-httpsclient' 'python2-pyopenssl' 'python2-pyasn1')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=()
_gitroot="https://github.com/chembl/chembl_webresource_client.git" 
_gitname="chembl_webresource_client"
_gitbranch="master"

package() {
  cd ${srcdir}
  mkdir build
  cd build
  git clone $_gitroot

  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/"
}
