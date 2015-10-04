# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-hyperkitty')
_pkgbase=hyperkitty
_commit=105de6f29f85adb86ededb77cd3f88a856bbfc52/
pkgver=1.0.3
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman archives"
arch=(any)
makedepends=('python2-setuptools')
depends=('python2-mailmanclient' 'python2-django-crispy-forms' 'python2-django-rest-framework'
         'python2-social-auth' 'python2-django-gravatar' 'python2-django-paintstore'
         'python2-django-compressor' 'python2-django-browserid' 'python2-django-haystack'
         'python2-pytz' 'python2-dateutil' 'python2-enum34' 'python2-networkx'
         'python2-robot-detection' 'python2-django-extensions' 'sassc')
url="https://gitlab.com/mailman/hyperkitty"
license=('GPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/hyperkitty/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('c1615b0c98a2611f64e1f1f18f0b57a1d8ef3aaf8d7b14f2f563ae93244c04a3')

package() {
  cd "$srcdir/$_pkgbase-v$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
