# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cleanup'
pkgver=8.0.0
pkgrel=1
pkgdesc="Automatically deletes old file for FileField and ImageField. It also deletes files on models instance deletion"
arch=(any)
url="https://github.com/un1t/django-cleanup"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ff0befba7b26e34ddfa1123e6baaade4e034c40a6577137a93ea8cbd492a4577')
makedepends=('python-setuptools')
depends=('python-django')

package_python-django-cleanup() {
  cd "$srcdir/django-cleanup-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

