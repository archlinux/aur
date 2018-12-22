# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=('any')
url="https://gitlab.com/Popkornium18/audiotag"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pytaglib' 'python-docopt')
source=("https://gitlab.com/Popkornium18/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('732c522e60b0e6b48b139251dafe1ea249e0fd54716b71591f8aec698dfbf7e3')

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
