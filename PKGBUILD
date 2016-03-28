# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-allauth
pkgname=('python-django-allauth' 'python2-django-allauth')
pkgver=0.25.2
pkgrel=1
pkgdesc="Integrated set of Django applications addressing authentication, registration, account management as well as 3rd party (social) account authentication."
arch=('any')
license=('MIT')
url="http://www.intenct.nl/projects/django-allauth/"
makedepends=('python' 'python-setuptools' 'python-django' 'python-openid'
             'python-requests-oauthlib' 'python-requests' 'python2'
             'python2-setuptools' 'python2-django' 'python2-openid'
             'python2-requests-oauthlib' 'python2-requests')
source=("https://github.com/pennersr/${pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('126722ca1b7d9d06adab6f7cf3af6062')

package_python-django-allauth() {
  depends=('python' 'python-django' 'python-openid' 'python-requests-oauthlib'
           'python-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-allauth() {
  depends=('python2' 'python2-django' 'python2-openid'
           'python2-requests-oauthlib' 'python2-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
