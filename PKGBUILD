# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.1.2
pkgrel=2
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.7' 'rrdtool' 'python-lxml' 'python-setuptools' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-django-reversion>=5.0' 'python-django-rest-framework>=3.13' 'python-dnspython' 'python-redis'
         'python-passlib' 'python-factory_boy' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield'
         'python-django-xforwardedfor-middleware' 'python-django-otp' 'python-django-filter' 'python-greenlet' 'python-gevent' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath')
depends=('python>=3.7' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet'
         'python-django-reversion>=5.0' 'python-passlib' 'python-factory_boy' 'python-django-xforwardedfor-middleware>=2.0')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('139252785b70be3c7968e5a4f6cd1f2c66e205b533cf5399849ccc21516e5216e8fb25d40a394798cccc45b0b73cd80a4b63a11250b5167ae1a6de93656888b0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
