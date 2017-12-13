# Maintainer: Ekin Dursun <ekindursun@gmail.com>
pkgname=python-mpv
pkgver=0.3.7
pkgrel=1
pkgdesc="Python interface to the mpv media player"
arch=('any')
url="https://github.com/jaseg/python-mpv"
license=('AGPL3')
depends=("mpv" "python")
conflicts=('python-mpv-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3de4ce48d6d4ecf92f11317c6c02de28')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
