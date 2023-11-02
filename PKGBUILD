# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-django-docs
pkgver=4.2
pkgrel=1
pkgdesc="Documentation for Python Django module."
arch=('any')
url='https://docs.djangoproject.com/'
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
sha256sums=('d1ed9075ebd48d7e381a99f176eaeca17d3f86bf4390ea6860871c69fab40b9d')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}
# vim:set ts=4 sw=4 et:
