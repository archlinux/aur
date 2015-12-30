# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-contact-form10
pkgname=('python-django-contact-form10' 'python2-django-contact-form10')
pkgver=1.0
pkgrel=1
pkgdesc="Generic contact-form application for Django (Version 1.0)"
arch=('any')
license=('BSD')
url="https://github.com/ubernostrum/django-contact-form"
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/d/django-contact-form/django-contact-form-${pkgver}.tar.gz")
md5sums=('878856c5de059bfeebe8788fd298ed0e')

package_python-django-contact-form10() {
  depends=('python')

  cd "${srcdir}/django-contact-form-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-contact-form10() {
  depends=('python2')

  cd "${srcdir}/django-contact-form-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
