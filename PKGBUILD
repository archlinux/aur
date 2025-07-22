# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# vim:set ts=4 sw=4 et:

pkgname=python-django-docs
pkgver=5.2
pkgrel=2
pkgdesc="Documentation for the Django framework"
arch=('any')
url='https://docs.djangoproject.com/'
license=('BSD-3-Clause')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}

sha256sums=('2f92314cb76e08cff82da3f0ff6fcf63db23d8745777c7239ec4af503e4481e9')
