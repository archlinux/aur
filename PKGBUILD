# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-appconf')
_pkgbase='django-appconf'
pkgver=1.0.2
pkgrel=1
pkgdesc="A helper class for handling configuration defaults of packaged Django apps gracefully"
arch=(any)
url="https://github.com/django-compressor/django-appconf"
license=('BSD')
options=(!emptydirs)
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/django-compressor/django-appconf/archive/v${pkgver}.tar.gz")
sha256sums=('7ed2a219b0195d13c7f7e82d77710c3a3478c997049a3749aaf16a319a084933')
makedepends=('python2-setuptools')

package_python2-django-appconf() {
  depends=('python2-django' 'python2-six')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
