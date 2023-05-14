# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>

pkgname=python-simplebitcoinfuncs
pkgver=0.1.5
pkgrel=6
pkgdesc='Simple and easy functions for common Bitcoin operations'
arch=('any')
url='https://github.com/maxweisspoker/simplebitcoinfuncs'
license=('MIT')
depends=('python-setuptools' 'python-pbkdf2')
provides=('python-simplebitcoinfuncs')
conflicts=('python-simplebitcoinfuncs')
source=('git+https://github.com/maxweisspoker/simplebitcoinfuncs')
sha256sums=('SKIP')
package() {
    cd "$srcdir/simplebitcoinfuncs/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
