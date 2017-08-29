# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>

pkgname=python2-simplebitcoinfuncs
pkgver=0.1.5
pkgrel=1
pkgdesc='Simple and easy functions for common Bitcoin operations'
arch=('any')
url='https://github.com/maxweisspoker/simplebitcoinfuncs'
license=('MIT')
depends=('python2-setuptools' 'python2-pbkdf2')
provides=('python2-simplebitcoinfuncs')
conflicts=('python2-simplebitcoinfuncs')
source=('git://github.com/maxweisspoker/simplebitcoinfuncs')
sha256sums=('SKIP')
package() {
    cd "$srcdir/simplebitcoinfuncs/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
