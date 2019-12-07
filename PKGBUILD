# Maintainer: Ekin Dursun <ekindursun@gmail.com>
pkgname=python-mpv
pkgver=0.4.5
pkgrel=1
pkgdesc="Python interface to the mpv media player"
arch=('any')
url="https://github.com/jaseg/python-mpv"
license=('AGPL3')
depends=("mpv" "python>=3.5")
optdepends=('python-pillow: raw screenshot support')
makedepends=("python-setuptools")
conflicts=('python-mpv-git' 'python-pympv' 'python-pympv-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4183dbed697549d1cc272fee7875b5c9')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
