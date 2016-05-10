# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=python2-flask-moment
pkgver=0.5.1
pkgrel=1
pkgdesc="Formatting of dates and times in Flask templates using moment.js."
arch=('any')
url="https://pypi.python.org/pypi/Flask-Moment"
license=('MIT')
depends=('python2-flask')
optdepends=('python2-nose')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-Moment/Flask-Moment-${pkgver}.tar.gz")
md5sums=('6aa1764769e86aea1a2a64e36cd76181')

package() {
    cd $srcdir/Flask-Moment-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm0664 "${srcdir}/Flask-Moment-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

