# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>
# Contributor: sl13lp <slackpinguino@gmail.com>

pkgname=python-nmap
pkgver=0.3.7
pkgrel=1
pkgdesc="A Python library which helps in using the nmap port scanner. required nmap software"
arch=("any")
url="http://xael.org/norman/python/python-nmap"
license=('GPL3')
depends=('python' 'nmap')
source="http://xael.org/norman/python/python-nmap/$pkgname-$pkgver.tar.gz"
md5sums=('3ed35d4093a04b2ad2b3a6447dd0588e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
