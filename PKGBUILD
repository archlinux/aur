# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# vim:set ts=4 sw=4 et:

pkgname=python-django-docs
pkgver=6.0
pkgrel=3
pkgdesc="Documentation for the Django framework"
arch=('any')
url='https://docs.djangoproject.com/'
license=('BSD-3-Clause')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
sha256sums=('6655b5a194a31d379cea055a6bcc857c6dbf37a4bd4b30a6187efab15946aa2e')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}
