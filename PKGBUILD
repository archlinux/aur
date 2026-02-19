# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=othellotk
_pkgname=othelloTk
pkgver=0.1.1
pkgrel=1
pkgdesc="Othello (aka reversi) is an Edax gui to play Othello against the Edax engine"
arch=('any')
url="https://johncheetham.com/projects/othellotk/index.html"
license=('GPL-3.0-only')
depends=('python3' 'tk' 'python-setuptools' 'edax-reversi')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/johncheetham/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c3e0634ccd705e074cb45802944a626deb8169df439ff0737e9c4bdd80391adb')            

package() {
   cd ${srcdir}/${_pkgname}-${pkgver}
   python setup.py install --root $pkgdir
}
