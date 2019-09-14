# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=samuel
pkgver=0.1.9
pkgrel=1
pkgdesc="An open source Draughts Game for Linux"
arch=('any')
url="http://johncheetham.com/projects/samuel/"
license=('GPL3')
depends=('python-gobject')
source=(https://github.com/johncheetham/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('ac10492bab344f4a0d1abd8f0e397da8cbeb590a44fc1a8b914f919e072d5b9a')



package() {
   cd $srcdir/$pkgname-$pkgver

   python setup.py install --root $pkgdir
}
