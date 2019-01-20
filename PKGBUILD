# Maintainer: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs
_gitname=GDriveFS
pkgver=0.14.12
pkgrel=2
pkgdesc='A complete FUSE adapter for Google Drive'
url='https://github.com/dsoprea/GDriveFS'
depends=(
  'python2'
  'python2-dateutil'
  'python2-fusepy'
  'python2-gevent'
  'python2-google-api-python-client'
  'python2-greenlet'
  'python2-httplib2'
  'python2-oauth2client'
  'python2-six'
  'python2-wsgiref'
)
makedepends=('python2-distribute')
license=('GPL2')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('607f3cd368070fa67185418c96ab9a1109efc8281e7c8a5dd10bf816cff98554')

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
