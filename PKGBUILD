# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
# Originally maintained and submitted: mitsuse <mitsuset - gmail>

pkgname=python2-flask-script
pkgver=2.0.5
pkgrel=1
pkgdesc="Flask support for writing external scripts."
arch=('any')
url="http://pypi.python.org/pypi/Flask-Script"
license=('BSD')
depends=('python2-flask')
optdepends=('python2-nose')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-Script/Flask-Script-${pkgver}.tar.gz")
md5sums=(e5c73d3b7937f5b88942f342f9617029)

package() {
    cd $srcdir/Flask-Script-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm0664 "${srcdir}/Flask-Script-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

