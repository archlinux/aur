# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=2.9.3
pkgrel=1
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python>=3.8' 'rrdtool' 'python-lxml' 'python-setuptools-scm' 'zlib' 'python-wheel'
         'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-bcrypt' 'python-asgiref'
         'python-chardet' 'python-django-reversion>=6.1' 'python-django-rest-framework>=3.16' 'python-dnspython' 'python-redis>=7.1'
         'python-passlib' 'python-uritemplate' 'python-feedparser' 'python-django-jsonfield' 'python-django-rq>=4.0'
         'python-django-xforwardedfor-middleware' 'python-django-filter' 'python-greenlet' 'python-fido2>=2.1' 'python-qrcode'
         'python-progressbar' 'python-dateutil' 'python-cryptography' 'python-pytz' 'python-chardet' 'python-ovh' 'python-oath'
		 'python-magic' 'python-tldextract' 'python-reportlab' 'python-aiosmtplib')
depends=('python>=3.8' 'python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-pycryptodome' 'python-chardet'
         'python-django-reversion>=6.1' 'python-passlib' 'python-django-xforwardedfor-middleware' 'python-sievelib')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-django-otp>=1.7'
			'python-psycopg2' 'gunicorn' 'python-vex' 'python-pillow' 'python-factory-boy')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9753407708b3f69561889f19cb45ba9b1b675971618066769024c2327348c89647556364a96916b195b7d037e2f3f8bd1f2f93ae15c547bd7322bfc8d218b87c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
