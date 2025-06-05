# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# vim:set ts=4 sw=4 et:

pkgname=python-django-docs
pkgver=5.2
pkgrel=1
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

sha256sums=('02fb9605550bf109f1ae2fda07eb91a29f80a932985409185fb664a0bc5f5d71')
