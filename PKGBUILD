# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-loguru')
pkgver=0.4.0
pkgrel=1
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama' 'python-better-exceptions-fork' 'python-ansimarkup')
makedepends=('python-setuptools')
source=("https://github.com/Delgan/loguru/archive/master.zip")
md5sums=('SKIP')

package() {
  cd "loguru-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}