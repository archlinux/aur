# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# vim:set ts=4 sw=4 et:

pkgname=python-django-docs
pkgver=6.0
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

sha256sums=('e1bf8b58d4e3bc7d87b83d707f246905f8544b2c68687a4e973d415b5f836dc1')
