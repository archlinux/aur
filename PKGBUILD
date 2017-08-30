# Maintainer: Jake Howard <git+aur@theorangeone.net>
pkgname=tupload
pkgver=1.1.0
pkgrel=1
pkgdesc="Capture screenshots and upload them using rsync"
arch=('any')
url="https://github.com/RealOrangeOne/tupload"
license=('unknown')
depends=('python-setuptools' 'rsync' 'gnome-screenshot')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RealOrangeOne/tupload/archive/$pkgver.tar.gz")
sha512sums=('b940b8e55b83c09d09217fe1b139ecf99c00930342bde82f0b225fae85621dabc4fef880fa4c2d1c447967691c244c101385047edc6d56ae17d4a1f8fdb34410')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

