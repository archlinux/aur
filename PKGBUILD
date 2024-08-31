# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.3.2
pkgrel=2
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.8' 'rrdtool' 'python-lxml' 'python-setuptools-scm' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-django-reversion>=5.0' 'python-django-rest-framework>=3.13' 'python-dnspython' 'python-redis'
         'python-passlib' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield' 'python-django-rq'
         'python-django-xforwardedfor-middleware' 'python-django-filter' 'python-greenlet' 'python-gevent' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath'
		 'python-magic' 'python-tldextract' 'python-reportlab' 'python-aiosmtplib')
depends=('python>=3.8' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet'
         'python-django-reversion>=5.0' 'python-passlib' 'python-django-xforwardedfor-middleware' 'python-sievelib')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-django-otp'
			'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow' 'python-factory-boy')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e03c29275592837dfd7910647c361f9d827188cec5aac6c0e44d245dc1e44259514becc5a7a5874f09f236e0d917ddbc989df3432a5ad5bd97956a9d6093eecb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
