# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-loguru')
pkgver=0.2.5
pkgrel=2
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama' 'python-better-exceptions' 'python-ansimarkup')
makedepends=('python-setuptools')
source=("https://github.com/Delgan/loguru/archive/master.zip")
md5sums=('6503d88aa9e298bae092b96f9a49a75b')

package() {
  cd "loguru-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}