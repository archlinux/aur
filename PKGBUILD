# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-django-docs
pkgver=5.1
pkgrel=1
pkgdesc="Documentation for Python Django module."
arch=('any')
url='https://docs.djangoproject.com/'
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
sha256sums=('ec17fa7454e00efe8b33f64fda2da856f5cb323acd099644cc6a615b849444f2')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d ${pkgdir}/usr/share/doc/python-django/html
	cp -r ./* ${pkgdir}/usr/share/doc/python-django/html/
	chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-django/html
}
# vim:set ts=4 sw=4 et:
