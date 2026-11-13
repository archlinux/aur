# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.13.0
pkgrel=1
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.8' 'rrdtool' 'python-lxml' 'python-setuptools-scm' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-django-reversion>=6.5' 'python-django-rest-framework>=3.16' 'python-dnspython' 'python-redis>=7.1'
         'python-passlib' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield' 'python-django-rq>=4.0'
         'python-django-xforwardedfor-middleware' 'python-django-filter' 'python-greenlet' 'python-fido2>=2.1' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath'
		 'python-magic' 'python-tldextract' 'python-reportlab' 'python-aiosmtplib')
depends=('python>=3.8' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet'
         'python-django-reversion>=6.5' 'python-passlib' 'python-django-xforwardedfor-middleware' 'python-sievelib>=1.6' 'python-caldav>=3.6')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-django-otp>=1.7'
			'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow' 'python-factory-boy')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7828ed136db279ef2753d0fdac21a4986db2698f2d9c70d955505236466158fc5a9ef48e3b901897241eef3a73076aa43278f65025adfc01354c376d0157432c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
