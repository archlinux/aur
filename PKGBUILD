# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cleanup'
pkgver=5.0.0
pkgrel=1
pkgdesc="Automatically deletes old file for FileField and ImageField. It also deletes files on models instance deletion"
arch=(any)
url="https://github.com/un1t/django-cleanup"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d1038ba64d7bd8cda183b5db22407dc09f3c787e0074e96910777989a759c093')
makedepends=('python-setuptools')
depends=('python-django')

package_python-django-cleanup() {
  cd "$srcdir/django-cleanup-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

