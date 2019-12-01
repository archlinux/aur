# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python-django-hyperkitty')
_pkgbase=hyperkitty
_commit=105de6f29f85adb86ededb77cd3f88a856bbfc52/
pkgver=1.0.3
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman archives"
arch=(any)
makedepends=('python-setuptools')
depends=('python-mailmanclient' 'python-django-crispy-forms' 'python-django-rest-framework'
         'python-social-auth' 'python-django-gravatar' 'python-django-paintstore'
         'python-django-compressor' 'python-django-browserid' 'python-django-haystack'
         'python-pytz' 'python-dateutil' 'python-enum34' 'python-networkx'
         'python-robot-detection' 'python-django-extensions' 'sassc')
url="https://gitlab.com/mailman/hyperkitty"
license=('GPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/hyperkitty/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('c1615b0c98a2611f64e1f1f18f0b57a1d8ef3aaf8d7b14f2f563ae93244c04a3')

package() {
  cd "$srcdir/$_pkgbase-v$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
