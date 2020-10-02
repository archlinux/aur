# Maintainer: willemw <willemw12@gmail.com>
# Contributors: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs
pkgver=0.14.13
pkgrel=1
pkgdesc="An innovative FUSE wrapper for Google Drive"
arch=('any')
url="https://github.com/dsoprea/GDriveFS"
license=('GPL2')
depends=('python-dateutil'
         'python-fusepy'
         'python-google-api-python-client'
         'python-greenlet'
         'python-httplib2'
         'python-oauth2client'
         'python-six')
makedepends=('python-distribute')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('099a4d64eb7c223e04b0d88c0334331247f69cddb4de425f2b13c620e3778514')

_gitname=GDriveFS

package() {
  cd $_gitname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

