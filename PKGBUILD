# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.2.2
pkgrel=1
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.8' 'rrdtool' 'python-lxml' 'python-setuptools' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-django-reversion>=5.0' 'python-django-rest-framework>=3.13' 'python-dnspython' 'python-redis'
         'python-passlib' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield'
         'python-django-xforwardedfor-middleware' 'python-django-filter' 'python-greenlet' 'python-gevent' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath')
depends=('python>=3.8' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet'
         'python-django-reversion>=5.0' 'python-passlib' 'python-django-xforwardedfor-middleware')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-django-otp'
			'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow' 'python-factory-boy')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('42ebc48dbcb497239b8c6c7a1ff8c9d66a3fdc7ba01ac60ae86053bf78c2bad6f1f04c2ff1ab37f572d80a63e5bc160a78c56e780f8e378b547b4bf2ab800967')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
