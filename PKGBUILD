# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.0.1
pkgrel=2
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.7' 'rrdtool' 'python-lxml' 'python-setuptools' 'zlib' 'python-wheel')
depends=('python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-crypto' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-argparse' 'python-django-reversion' 'python-django-rest-framework>=3.13' 'python-dnspython' 'python-redis'
         'python-passlib' 'python-django-versionfield2' 'python-factory_boy' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield'
         'python-django-xforwardedfor-middleware' 'python-django-otp' 'python-django-filter' 'python-greenlet' 'python-gevent' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath' 'python-aioredis') 
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2110ebf167bde8c50e8278d22e2506eaee89ea4b8c369696d5c5c20f237a5ef21819ac3c01f6b5f0d663f0f9910e9d970af347923ffc0cfae2ba099d5df0a937')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
