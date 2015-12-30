# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=python2-django-assets
pkgver=0.11
pkgrel=1
pkgdesc="Asset management for Django, to compress and merge CSS and Javascript files"
arch=('any')
license=('BSD')
url="https://github.com/miracle2k/${pkgbase}/"
depends=('python2' 'python2-django' 'python2-webassets')
makedepends=('python2-setuptools')
source=("https://github.com/miracle2k/${pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('97f7ce3ba6019d90865e0f4f6ac2c0b7')

package() {
  cd "${srcdir}/django-assets-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
