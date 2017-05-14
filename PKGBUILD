# Maintainer:  Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage
pkgver=2.15
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='http://dosage.rocks'
license=('GPL')
depends=('python' 'python-requests')
source=("https://github.com/webcomics/$pkgname/archive/$pkgver.tar.gz")
md5sums=('fc685c521478a95a9b667e05faa99d10')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
