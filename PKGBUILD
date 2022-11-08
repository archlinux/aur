# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-django-docs
pkgver=4.1
pkgrel=1
pkgdesc="Documentation for Python Django module."
arch=('any')
url='https://docs.djangoproject.com/'
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
sha256sums=('395d2c8469be21aa0a54b0c16d138e831937a87deddcd167546aa79e062a5fba')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}
# vim:set ts=4 sw=4 et:
