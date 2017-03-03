# Maintainer: Andreas Bilke <abilke ÄT cosy DOT sbg DOT ac DOT at>

pkgbase=python-django-progressbarupload
pkgname=("python-django-progressbarupload" "python2-django-progressbarupload")
_pkgname=django-progressbarupload
pkgver=0.1.7
pkgrel=1
pkgdesc="A django module for HTML5 uploads"
arch=(any)
url="https://github.com/ouhouhsami/django-progressbarupload"
license=("BSD")
source=("https://github.com/ouhouhsami/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c12d3cc968c5c9de2083d8891359cd080dacb9de0c1018cb2f0cd1e948505afe')

package_python-django-progressbarupload() {
    depends=("python-django")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/"
}

package_python2-django-progressbarupload() {
    depends=("python2-django")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/"
}

