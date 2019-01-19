# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.22
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python'
         'python-docopt')

makedepends=(
            'python'
            'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('277471d41b89d0cd43846c2bdb52b1fe020afcc3cb974e8639a42f29bbbf8ec0')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 et:
