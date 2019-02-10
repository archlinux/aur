# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-ansimarkup')
pkgver=1.4.0
pkgrel=1
pkgdesc='Produce colored terminal text with an xml-like markup'
arch=('any')
url='https://github.com/gvalkov/python-ansimarkup'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/gvalkov/python-ansimarkup/archive/master.zip")
md5sums=('5b504c291ebbd0e0b93062318faa7f2d')

package() {
  
  cd "$pkgname-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}