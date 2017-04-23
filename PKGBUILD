# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname='python-django-modeladmin-reorder'
pkgver=0.2
pkgrel=1
pkgdesc="Custom ordering for the apps and models in the admin app"
arch=('any')
url="https://github.com/mishbahr/django-modeladmin-reorder"
license=('PSF')

source=("https://pypi.python.org/packages/8f/2d/5219e2e9edd3c7c8b25b78ab62c745d0683d198ed898f0e715517b1299af/django-modeladmin-reorder-${pkgver}.tar.gz")
makedepends=('python-django')
depends=('python-django')
md5sums=('36a866aee0e41e9a528874ed41abd239')


package() {
  cd "$srcdir/django-modeladmin-reorder-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
