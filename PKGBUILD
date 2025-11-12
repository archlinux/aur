# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# vim:set ts=4 sw=4 et:

pkgname=python-django-docs
pkgver=5.2
pkgrel=3
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

sha256sums=('c76ec373ab1725a7744e8422725ea7c417234c546ffbbae4c9f898de92172ced')
