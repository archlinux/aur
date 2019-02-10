# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-better-exceptions-fork')
pkgver=0.2.1
pkgrel=5
pkgdesc='Pretty and helpful exceptions, automatically'
arch=('any')
url='https://github.com/Delgan/better-exceptions'
license=('MIT')
depends=('python')
conflicts=('python-better-exceptions')
makedepends=('python-setuptools')
source=("https://github.com/Delgan/better-exceptions/archive/master.zip"
"setup-fork.py")
md5sums=('29068e4a8f946b390aafae240a0f0470')

package() {
  cd "better-exceptions-master"
  python setup-fork.py install --root="$pkgdir/" --optimize=1
}