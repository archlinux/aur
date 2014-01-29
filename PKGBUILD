# Maintainer:   Valentin V. Bartenev <ne@vbart.ru> http://vbart.info/
# Contributor:  apkawa <apkawa@gmail.com>
# Contributor:  Jacek Roszkowski <j.roszk@gmail.com>

pkgname=django-debug-toolbar
pkgver=0.8.5
pkgrel=2
pkgdesc='A configurable set of panels that display various debug information about the current request/response.'
arch=(any)
url='https://github.com/django-debug-toolbar/django-debug-toolbar'
license=('custom:BSD')
depends=('python' 'django')

source=("$pkgname-$pkgver.tar.gz::https://github.com/django-debug-toolbar/django-debug-toolbar/tarball/v$pkgver")
md5sums=(56f0de572a767230e14aaa21997336eb)
sha256sums=(eb88affe759d05bb5eed10e1c56a4cad00a7f90b362dceef5baaea88cfa0bfa2)
_subdir="$pkgname-$pkgname-cc4d230"

build() {
    cd "$srcdir/$_subdir"
    python2 setup.py install --root="$pkgdir/" -O1
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Enjoy! ;)