# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-django-docs
pkgver=4.1
pkgrel=2
pkgdesc="Documentation for Python Django module."
arch=('any')
url='https://docs.djangoproject.com/'
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
sha256sums=('116279104eff6fc0429021f55480268497a0291438493abbd2d7c008d756d2b0')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}
# vim:set ts=4 sw=4 et:
