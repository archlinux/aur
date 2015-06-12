# Maintainer: Benjamin A. Shelton <zancarius at gmail _ com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-paging
pkgver=0.2.5
pkgrel=1
pkgdesc="An efficient paginator that works."
arch=(any)
url="http://pypi.python.org/pypi/django-paging"
license=(BSD)
depends=(python2 python2-django)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(282ef984815f73ce43189d288b2bae2a)

package () {

    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}