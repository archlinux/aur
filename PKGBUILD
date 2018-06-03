# Maintainer: Ekin Dursun <ekindursun@gmail.com>
pkgname=python-mpv
pkgver=0.3.8
pkgrel=2
pkgdesc="Python interface to the mpv media player"
arch=('any')
url="https://github.com/jaseg/python-mpv"
license=('AGPL3')
depends=("mpv" "python")
makedepends=("python-setuptools")
conflicts=('python-mpv-git' 'python-pympv' 'python-pympv-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9ac90ead445495f6822634f87e3aae06')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
