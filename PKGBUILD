# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-better-exceptions-fork')
pkgver=0.2.1
pkgrel=1
epoch=1
pkgdesc='Pretty and helpful exceptions, automatically'
arch=('any')
url='https://github.com/Delgan/better-exceptions'
license=('MIT')
depends=('python')
conflicts=('python-better-exceptions')
makedepends=('python-setuptools')
source=("https://github.com/delgan/better-exceptions/archive/0.2.1.post6.tar.gz")
md5sums=('4ee52c1890fe03a96b5ac6ce0e813a9b')


package() {
  ls
  cd better-exceptions-master
  python setup.py install --root="$pkgdir/" --optimize=1
}