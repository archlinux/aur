# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.1.1
pkgrel=2
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.7' 'rrdtool' 'python-lxml' 'python-setuptools' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-argparse' 'python-django-reversion' 'python-django-rest-framework>=3.13' 'python-dnspython' 'python-redis'
         'python-passlib' 'python-django-versionfield2' 'python-factory_boy' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield'
         'python-django-xforwardedfor-middleware' 'python-django-otp' 'python-django-filter' 'python-greenlet' 'python-gevent' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath' 'python-aioredis1')
depends=('python>=3.7' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet' 'python-argparse'
         'python-django-reversion' 'python-passlib' 'python-django-versionfield2' 'python-factory_boy' 'python-django-xforwardedfor-middleware')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('aee30be20059857356a7f27c36f780386f240ead826e052b9a13b9548f5abe8c867d7124aa370d75e6693a054b9279231bde827554985a09f2f65bf6e7f7eed1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
