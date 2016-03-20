# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-tdl
pkgver=1.5.2
pkgrel=1
pkgdesc="Pythonic CFFI port of libtcod."
arch=('any')
url="https://pypi.python.org/pypi/tdl"
license=('BSD')
depends=('python' 'python-cffi' 'python-libtcod-cffi' 'unzip')
source=("python-tdl-$pkgver.zip::https://pypi.python.org/packages/source/t/tdl/tdl-1.5.2.zip#md5=fb608df39249aa7e8fab0adbd909ba95")
md5sums=('fb608df39249aa7e8fab0adbd909ba95')

package() {
	cd "tdl-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
